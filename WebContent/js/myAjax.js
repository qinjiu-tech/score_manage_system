(function () {
    function ajax(url, data) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: "get",
                url: url,
                data: data,
                dataType: "json",
                success: (res) => {
                    resolve(res);
                },
                error: (err) => {
                    reject("Error:获取后台数据失败!" + err);
                }
            });
        });
    }
    window.ajax = ajax;
})(window);