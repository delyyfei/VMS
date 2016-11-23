<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="comm.jsp" %>
</head>
<body class="zh_CN">
<nav class="navbar navbar-default">
    <button id="addBtn" class="btn btn-primary navbar-btn" type="button">
        <span class="glyphicon glyphicon-plus"></span> 新增
    </button>
    <button id="delBtn" class="btn btn-danger navbar-btn" type="button">
        <span class="glyphicon glyphicon-trash"></span> 删除
    </button>
    <button id="refreshBtn" class="btn btn-primary navbar-btn" type="button">
        <span class="glyphicon glyphicon-refresh"></span> 刷新
    </button>
</nav>
<div class="alert alert-success fade in" id="successTip"></div>
<div class="alert alert-danger fade in" id="failedTip"></div>
<table id="operatorTable" class="table table-striped table-bordered table-hover">
    <thead>
    <th style="width: 30px"><input title="" type="checkbox"/></th>
    <th style="width: 40px">#</th>
    <th style="width: 120px">操作</th>
    <th>ID</th>
    <th>名称</th>
    <th>登录时间</th>
    </thead>
    <tbody></tbody>
</table>
<div class="modal" id="operatorDialog" tabindex="-1">
    <div class="modal-dialog" style="width:350px;">
        <div class="modal-content">
            <div class="modal-header"></div>
            <div class="modal-body">
                <form id="operatorForm" action="javascript:void(null);">
                    <div class="form-group">
                        <label class="control-label">ID&nbsp;<span class="glyphicon glyphicon-star text-danger"></span></label>
                        <input class="form-control" name="operatorModel.id" title="" type="text" maxlength="20"
                               placeholder="只能是数字、字母、下划线">
                    </div>
                    <div class="form-group">
                        <label class="control-label">姓名</label>
                        <input class="form-control" name="operatorModel.name" title="" type="text"/>
                    </div>
                    <div class="form-group">
                        <label class="control-label">密码&nbsp;<span class="glyphicon glyphicon-star text-danger"></span></label>
                        <input class="form-control" name="operatorModel.password" title="" type="password"
                               maxlength="16">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span> 取消
                </button>
                <button class="btn btn-primary">
                    <span class="glyphicon glyphicon-ok"></span> 确认
                </button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var dataList = [];
    var operatorTable = $('#operatorTable').tableList({
        url: '../operator/findAll',
        finishCallBack: initOperatorList,
        template: htmlTemplate
    });
    var actionObj = new Actions({
        successCallBack: function () {
            operatorTable.refresh();
        }
    });
    var alertObj = new Alert({
        checkTable: '#operatorTable',
        confrimAction: delAction,
        successCallBack: function () {
            operatorTable.refresh();
        }
    });
    $(function () {
        $('#addBtn').click(function () {
            $('#operatorDialog .modal-header').html('新增');
            $('input[name="operatorModel.id"]').attr('readonly', false);
            $('#operatorForm input').val('');
            $('#operatorDialog').modal('show');
        });
        $('#delBtn').click(function () {
            alertObj.check();
        });
        $('#refreshBtn').click(function () {
            operatorTable.refresh();
        });

    });
    function initOperatorList(__dataList) {
        dataList = __dataList;
        $('.editBtn').click(function () {
            var operatorObj = dataList[$(this).attr('data-index')];
            $('#operatorDialog .modal-header').html('编辑');
            $('#operatorForm input').val('');
            $('input[name="operatorModel.id"]').val(operatorObj.id).attr('readonly', true);
            $('input[name="operatorModel.name"]').val(operatorObj.name);
            $('input[name="operatorModel.password"]').val(operatorObj.password);
            $('#operatorDialog').modal('show');
        });
        $('.delBtn').click(function () {
            alertObj.cancel();
            $(this).parents('tr').find('input[type="checkbox"]').prop('checked', true);
            alertObj.check();
        });
    }
    function htmlTemplate(__index, __data) {
        var html = '<tr>';
        html += '<td><input type="checkbox" value="' + __data.id + '"/></td>';
        html += '<td>' + (__index + 1) + '</td>';
        html += '<td><button class="editBtn btn btn-primary btn-xs" type="button" data-index="' + __index + '"><span class="glyphicon glyphicon-edit"></span> 编辑</button>';
        html += '<button class="delBtn btn btn-danger btn-xs" type="button" data-index="' + __index + '"><span class="glyphicon glyphicon-trash"></span> 删除</button></td>';
        html += '<td>' + __data.id + '</td>';
        html += '<td>' + __data.name + '</td>';
        html += '<td>' + ToolUtil.utcFormat(__data.loginUTC) + '</td>';
        html += '</tr>';
        return html;
    }
    function delAction($checkboxs) {
        var params = '';
        $checkboxs.each(function (i) {
            params += '&collectionParam.list[' + i + ']=' + $(this).val();
        });
        actionObj.submit({
            url: '../operator/del',
            param: params
        })
    }
</script>
</body>
</html>
