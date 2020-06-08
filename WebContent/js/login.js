(function () {
    let isUser = false;

    init();

    function init() {
        bindEvent();
    }

    function bindEvent() {
        bindTab();
        bindLogin();
        bindRegister();
        bindIsUSer();
    }

    // 登录/注册区域切换
    function bindTab() {
        $('#tabs .tab').on('click', (e) => {
            const prevId = $('#tabs .tab.active').attr('data-id');
            $('#' + prevId).hide();
            $('#tabs .tab.active').removeClass('active');
            const target = e.target;
            $(target).addClass('active');
            const curId = $(target).attr('data-id');
            $('#' + curId).show();
        });
    }

    //登录按钮
    function bindLogin() {
        $('#login-btn').on('click', () => {
            const id = $('#login-form #id').val();
            const pwd = $('#login-form #pwd').val();
            const data = {
                id,
                pwd
            }
            let flag=true;
            if(id==null||pwd==null){
                flag=false;
                alert('请检查数据！');
            }else{
                flag=true;
            }
            if(flag){
                let pro = ajax('../login', data);
                pro = pro.then(res => {
                    console.log(res)
                    if (res.status == 'success') {
                        window.sessionStorage.id = id;
                        window.sessionStorage.type = res.data.type;
                        const str = `<div class="tip-content" style="color: green;">${res.msg}</div>`;
                        $('#my-modal').html(str).show();
                        setTimeout(() => {
                            $('#my-modal').hide();
                            window.location.href = "../html/index.html";
                        }, 500);
                    } else {
                        const str = `<div class="tip-content" style="color: red;">${res.msg}</div>`;
                        $('#my-modal').html(str).show();
                        setTimeout(() => {
                            $('#my-modal').hide();
                        }, 500);
                    }
                })
            }
        })
    }

    //注册按钮
    function bindRegister() {
        $('#register-btn').on('click', () => {
            const id = $('#register-form #id').val();
            const pwd = $('#register-form #pwd').val();
            const pwdSub=$('#pwd-sub').val();
            const type = $('#register-form .type-area .type[name="type"]:checked').val();
            const data = {
                id,
                pwd,
                type
            }
            let flag=true;
            if(id==null||pwd==null||pwdSub==null){
                flag=false;
                alert('请检查数据！');
            }else if(pwd!=pwdSub){
                flag=false;
                alert('两次密码输入不一致！');
            }else{
                flag=true;
            }
            if (isUser&&flag) {
                let pro = ajax('../register', data);
                pro = pro.then(res => {
                    console.log(res)
                    if (res.status == "success") {
                        const str = `<div class="tip-content" style="color: green;">${res.msg}</div>`;
                        $('#my-modal').html(str).show();
                        setTimeout(() => {
                            $('#my-modal').hide();
                            $('#tabs .login-tab').click();
                        }, 2000);
                    } else {
                        const str = `<div class="tip-content" style="color: red;">${res.msg}</div>`;
                        $('#my-modal').html(str).show();
                        setTimeout(() => {
                            $('#my-modal').hide();
                        }, 2000);
                    }
                })
            }
        })
    }

    //注册界面帐号框失去焦点
    function bindIsUSer() {
        $('#register-form #id').on('focus', () => {
            $('#my-modal').hide();
        });
        $('#register-form #id').on('blur', () => {
            const id = $('#register-form #id').val();
            const data = {
                id
            };
            let pro = ajax('../isUser', data);
            pro=pro.then(res => {
                console.log(res)
                if (res.status == "fail") {
                    isUser=false;
                    const str = `<div class="tip-content" style="color: red;">${res.msg}</div>`;
                    $('#my-modal').html(str).show();
                } else {
                    isUser = true;
                    $('#my-modal').hide();
                }
            })
        })
    }
})();