(function ($) {
    var TableScroll = function TableScroll(element, height, cutHeight) {
        this.init(element, height, cutHeight);
    }, old = null;
    TableScroll.prototype = {
        init: function (element, height, cutHeight) {
            this.height = height;
            this.cutHeight = cutHeight;
            this.$table = $(element);
            this.$thead = this.$table.find("thead");
            var tableId = this.$table.attr("id");
            this.$table.wrap('<div class="tableBox" id="' + tableId + '_tableBox"></div>');
            var headBoxHtml = '<div class="headBox" id="' + tableId + '_headBox"><table class="table table-bordered table-condensed"><thead>' + this.$thead.html() + "</thead></table></div>";
            this.$table.before(headBoxHtml);
            if (this.height > 0) {
                $("#" + tableId + "_tableBox").height(this.height);
            } else {
                $("#" + tableId + "_tableBox").height($(window).height() - this.cutHeight);
                var self = this;
                $(window).on("resize", function () {
                    $("#" + tableId + "_tableBox").height($(window).height() - self.cutHeight);
                });
            }
            $("#" + tableId + "_tableBox").on("scroll", function () {
                if ($(this).scrollTop() > 0) {
                    $("#" + tableId + "_headBox").show();
                    $("#" + tableId + "_headBox").css("top", $(this).scrollTop());
                } else $("#" + tableId + "_headBox").hide();
            });
            $("#" + tableId + "_headBox table thead input[type='checkbox']").change(function () {
                var isChecked = $(this).is(":checked");
                $("#" + tableId + " tbody input[type='checkbox']").each(function () {
                    $(this).prop("checked", isChecked);
                });
            });
        }
    };
    old = $.fn.tableScroll;
    $.fn.tableScroll = function (__height, __cutHeight) {
        var result = null;
        $(this).each(function (i, item) {
            var $this = $(item), data = $this.data("tableScroll"), height = typeof __height !== "number" ? 0 : __height, cutHeight = typeof __cutHeight !== "number" ? 0 : __cutHeight;
            if (!data) {
                $this.data("tableScroll", data = new TableScroll(this, height, cutHeight));
            } else {
                data.height = height;
                data.cutHeight = cutHeight;
            }
            result = data;
        });
        return result;
    };
})(jQuery);