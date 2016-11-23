/*
 * 
 * 增、删、改动作处理类
 */
var Actions = function Actions(options) {
    this.setOptions(options);
};

Actions.prototype = {
    /**
     * options:Actions类的属性
     * url:请求连接
     * param:请求参数
     * resultKey:返回json中获取结果的Key,如：{result:"success"}
     * tipKey:返回json中获取提示语的Key,如：{result:"success",tip:"新增成功！"}
     * successDiv:成功提示框的id
     * failedDiv:失败提示框的id
     * infoDiv:一般提示框的id
     * successCallBack:操作成功后执行的function
     * failedCallBack:操作失败后执行的function
     * infoCallBack:操作后执行的function
     */
    options: {
        url: "",
        param: "",
        resultKey: "result",
        tipKey: "tip",
        successDiv: "#successTip",
        failedDiv: "#failedTip",
        infoDiv: "#infoTip",
        successCallBack: function () {
        },
        failedCallBack: function () {
        },
        infoCallBack: function () {
        }
    },
    /**
     * 设置属性
     * @param options
     */
    setOptions: function (options) {
        this.options = $.extend({}, this.options, options);
    },
    /**
     * 提交请求
     * @param options
     */
    submit: function (options) {
        this.setOptions(options);
        var self = this;
        $.post(this.options.url, this.options.param, function (data) {
            var result = data[self.options.resultKey];
            var tip = data[self.options.tipKey];
            if (result == "success" && $.trim(tip).length > 0) {
                $(self.options.successDiv).html(tip);
                $(self.options.successDiv).slideDown();
                window.setTimeout(function () {
                    $(self.options.successDiv).slideUp();
                }, 3e3);
                if (typeof self.options.successCallBack === "function") self.options.successCallBack();
            } else if (result == "failed" && $.trim(tip).length > 0) {
                $(self.options.failedDiv).html(tip);
                $(self.options.failedDiv).slideDown();
                window.setTimeout(function () {
                    $(self.options.failedDiv).slideUp();
                }, 3e3);
                if (typeof self.options.failedCallBack === "function") self.options.failedCallBack();
            } else if ($.trim(tip).length > 0) {
                $(self.options.infoDiv).html('<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' + tip);
                $(self.options.infoDiv).slideDown();
                window.setTimeout(function () {
                    $(self.options.infoDiv).slideUp();
                }, 1e4);
                if (typeof self.options.infoCallBack === "function") self.options.infoCallBack();
            }
        });
    }
};