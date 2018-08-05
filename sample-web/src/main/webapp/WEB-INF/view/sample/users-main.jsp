<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
</head>
<body>
<div class="layui-container">
    <div class="layui-btn-group demoTable">
        <button class="layui-btn layui-btn-normal" lay-filter="userDialog">新增</button>
    </div>
    <div class="layui-row">
        <div class="layui-col-xs12">
            <table class="layui-hide" id="test"></table>
        </div>
    </div>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<div style="display: none;padding: 10px 20px;padding-left: 0;" id="userForm">
    <form class="layui-form" action="" lay-filter="user">
        <input type="hidden" name="id">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" required  lay-verify="required" placeholder="请输入名字" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">生日</label>
            <div class="layui-input-block">
                <input type="text" name="birthday" required  lay-verify="required" placeholder="请输入生日" autocomplete="off" class="layui-input layui-date">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="user">保存</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form', 'table', 'laydate'], function () {
        var layer = layui.layer,
            form = layui.form,
            table = layui.table,
            laydate = layui.laydate,
            $ = layui.$;

        if($('.layui-date').length > 0){
            laydate.render({
                elem: '.layui-date'
            });
        }

        var userTable = (function () {
            var tableId = 'test';
            table.render({
                elem: '#' + tableId,
                url:'${pageContext.request.contextPath}/users',
                cellMinWidth: 80 /*全局定义常规单元格的最小宽度，layui 2.2.1 新增*/,
                page: true,
                cols: [[
                    {field:'id', width:160, title: 'ID', sort: true},
                    {field:'name', minWidth:100, title: '用户名', sort: true},
                    {field:'birthday', width:120, title: '生日', sort: true},
                    {fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}
                ]],
                request: {
                    pageName: 'pageNum',
                    limitName: 'pageSize'
                },
                response: {
                    statusName: 'success',
                    statusCode: true,
                    msgName: 'msg',
                    countName: 'total',
                    dataName: 'rows'
                }
            });

            //监听工具条
            table.on('tool', function(obj){
                var data = obj.data;
                if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        userApi.del(data.id, function () {
                            userTable.reload();
                        });
                        layer.close(index);
                    });
                } else if(obj.event === 'edit'){
                    userDialog.open('编辑', data);
                }
            });

            return {
                reload: function(){
                    table.reload(tableId);
                }
            }
        })();

        form.on('submit(user)', function(data){
            userApi.save(data.field, function(){
                userTable.reload();
                userDialog.close();
            });
            return false;
        });

        var userApi = (function(){
            return {
                save: function(data, callback){
                    $.ajax({
                        url: '${pageContext.request.contextPath}/users/',
                        data: data,
                        type: 'POST',
                        success: function(response) {
                            if(response.success){
                                if(typeof(callback) == 'function'){
                                    callback();
                                }
                            } else {
                                layer.msg(response.msg);
                            }
                        }
                    });
                },
                del: function(id, callback){
                    $.ajax({
                        url: '${pageContext.request.contextPath}/users/' + id,
                        type: 'DELETE',
                        success: function(response) {
                            if(response.success){
                                if(typeof(callback) == 'function'){
                                    callback();
                                }
                            } else {
                                layer.msg(response.msg);
                            }
                        }
                    });
                }
            }
        })();

        var userDialog = (function(){
            var userDialogIndex;
            var userForm = $('#userForm');
            return {
                open: function(title, data){
                    userForm.children('form')[0].reset();
                    userForm.find('input[type="hidden"]').val('');
                    userDialogIndex = layer.open({
                        type: 1,
                        title: title,
                        area: '600px',
                        content: userForm
                    });
                    if(data){
                        form.val("user", data);
                    }
                },
                close: function(){
                    layer.close(userDialogIndex);
                }
            }
        })();

        $('.layui-btn[lay-filter="userDialog"]').on('click', function(){
            userDialog.open('新增');
        });

    });
</script>
</body>
</html>
