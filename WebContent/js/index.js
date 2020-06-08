(function () {
    // console.log(window.sessionStorage.id)
    // console.log(window.sessionStorage.type)
    const curId = window.sessionStorage.id;
    const curType = window.sessionStorage.type;
    console.log(curId, curType)
    let curFaculty = "";
    let curClasses = "";
    let curSpecial = "";
    let curSubjectArr = [];
    let scoreData = null;
    let eventObj = {}

    init();

    function init() {
        if (curType == "teacher") {
            renderFaculty();
        } else if (curType == "student") {
            renderMyScore();
        } else {
            renderRoot();
        }
        renderMyInfo();
        bindLink();
    }

    function renderRoot() {
        $('.content .row .root-area').show();
        bindAddInfo();
    }

    function bindAddInfo() {
        $('#info-form #submit').on('click', function (e) {
            e.preventDefault();
            const arr = $('#info-form').serializeArray();
            const obj = {}
            arr.forEach(ele => {
                if (ele.name == "classes") {
                    obj[ele.name] = +ele.value;
                } else {
                    obj[ele.name] = ele.value;
                }
            })
            obj.special = $('#info-form #special').val();
            obj.phone = $('#info-form #phone').val();
            let pro = ajax('../addInfo',obj);
            pro = pro.then(res => {
            	console.log(res)
                alert(res.msg)
            })
        })
    }


    // 成绩管理/我的信息
    function bindLink() {
        $('.content #score-manage').on('click', () => {
            $('#my-info').removeClass('active');
        });
        $('.content #my-info').on('click', () => {
            $('#score-manage').removeClass('active');
        });
        $('#score-manage0').on('click', () => {
            $('#head .navbar-collapse').removeClass('show');
            $('#my-info0').removeClass('active');
        });
        $('#my-info0').on('click', () => {
            $('#head .navbar-collapse').removeClass('show');
            $('#score-manage0').removeClass('active');
        });
    }

    // 渲染所有学院
    function renderFaculty() {
        let pro = ajax('../getFaculty');
        pro = pro.then(res => {
            console.log(res)
            if (res.status = "success") {
                let str = '';
                res.data.forEach(ele => {
                    str += `<div class="col-md-3 col-sm-4 col-6">
                                <p class="p-faculty">${ele.title}</p>
                            </div>`;
                });
                $('#score-area .faculty-area .faculty').append(str);
                $('#score-area .faculty-area').show();
                if (!eventObj["bindFacutly"]) {
                    bindFacutly();
                    eventObj["bindFacutly"] = true;
                }
            }
        })
    }

    // 每个学院绑定点击事件
    function bindFacutly() {
        $('#score-area .p-faculty').on('click', (e) => {
            curFaculty = $(e.target).text();
            $('#score-area .faculty-area').hide();
            renderClasses();
        })
    }

    // 渲染指定学院的所有年级
    function renderClasses() {
        $('#score-area .classes-area').show();
        if (!eventObj["bindClasses"]) {
            bindClasses();
            eventObj["bindClasses"] = true;
        }
        if (!eventObj["bindBackBtn"]) {
            bindBackBtn();
            eventObj["bindBackBtn"] = true;
        }
    }

    // 每个年级绑定点击事件
    function bindClasses() {
        $('#score-area .p-classes').on('click', (e) => {
            curClasses = $(e.target).text();
            renderSpecial();
        })
    }

    //渲染指定学院的所有专业
    function renderSpecial() {
        let pro = ajax('../getSpecial', {
            title: curFaculty
        });
        pro = pro.then(res => {
            console.log(res)
            if (res.status == "success") {
                $('#score-area .classes-area').hide();
                let str = "";
                res.data.forEach(ele => {
                    str += `<div class="col-md-3 col-sm-4 col-6">
                                <p class="p-special">${ele.name}</p>
                            </div>`;
                });
                $('#score-area .special-area .special').html(str);
                $('#score-area .special-area').show();
                bindSpecial();
            } else {
                alert(res.msg)
            }
        })
    }

    //每个专业绑定点击事件
    function bindSpecial() {
        $('#score-area .p-special').on('click', (e) => {
            curSpecial = $(e.target).text();
            renderSubject();
            renderScoreTable();
        })
    }

    //渲染指定年级和专业的科目
    function renderSubject() {
        let pro = ajax('../getSubject', {
            classes: curClasses,
            special: curSpecial
        });
        pro = pro.then(res => {
            console.log(res)
            curSubjectArr = [];
            if (res.status == 'success') {
                $('#score-area .special-area').hide();
                let str1 = `<tr class="table-secondary">
                            <th>学号</th>
                            <th>姓名</th>`;
                let str3 = `  <th>修改成绩</th>
                        </tr>`;
                let str2 = '';
                res.data.forEach(ele => {
                    str2 += `<th>${ele.subject}</th>`;
                    curSubjectArr.push(ele.subject);
                });
                $('#score-area .score-table .table thead').html(str1 + str2 + str3);
                $('#score-area .score-table').show();
            } else {
                alert(res.msg);
            }
        })
    }

    //渲染指定年级和专业的成绩表
    function renderScoreTable() {
        let pro = ajax('../getScoreTable', {
            classes: curClasses,
            special: curSpecial
        });
        pro = pro.then(res => {
            console.log(res)
            console.log(res.data)
            scoreData = res.data;
            let str = ``;
            res.data.forEach((ele, index) => {
                let str1 = `<tr class="table-secondary">
                             <td>${ele.id}</td>
                             <td>${ele.name}</td>`;
                let str3 = ` <td>
                                <button id="edit-btn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#editMessage">
                                    <span class="edit-score" data-index="${index}">编辑</span>    
                                </button>
                            </td>`;
                let str2 = ``;
                curSubjectArr.forEach(item => {
                    if (ele.data[item]) {
                        str2 += `<td>${ele.data[item]}</td>`;
                    } else {
                        str2 += `<td>0</td>`;
                    }
                });
                str += (str1 + str2 + str3);
            })
            console.log(curSubjectArr)
            $('#score-area .score-table .table tbody').html(str);
            renderForm();
            bindEditBtn();
            if (!eventObj["bindEchartsBtn"]) {
                bindEchartsBtn();
                eventObj["bindEchartsBtn"] = true;
            }
        })
    }

    //渲染编辑成绩的表单
    function renderForm() {
        const str1 = `<div class="form-group form-inline">
                        <label for="id">学号：</label>
                        <input type="text" name="id" id="id" class="form-control" disabled>
                    </div>
                    <div class="form-group form-inline">
                        <label for="name">姓名：</label>
                        <input id="name" name="name" type="text" class="form-control" disabled>
                    </div>`;
        let str2 = ``;
        curSubjectArr.forEach(ele => {
            str2 += `<div class="form-group form-inline">
                        <label for="${ele}">${ele}：</label>
                        <input id="${ele}" name="${ele}" type="text" class="form-control">
                    </div>`;
        });
        $('#edit-form').html(str1 + str2);
        if (!eventObj["bindSubmit"]) {
            bindSubmit();
            eventObj["bindSubmit"] = true;
        }
        if (!eventObj["bindReset"]) {
            bindReset();
            eventObj["bindReset"] = true;
        }
    }

    //点击编辑回填数据
    function bindEditBtn() {
        $('#edit-btn .edit-score').on('click', (e) => {
            const index = $(e.target).attr('data-index');
            $("#edit-form #id").val(scoreData[index].id);
            $("#edit-form #name").val(scoreData[index].name);
            curSubjectArr.forEach((ele) => {
                let score = null;
                if (scoreData[index].data[ele]) {
                    score = scoreData[index].data[ele];
                } else {
                    score = 0;
                }
                $("#edit-form #" + ele).val(score);
            });
            console.log(scoreData[index])
        })
    }

    //提交按钮
    function bindSubmit() {
        $('#submitBtn').on('click', () => {
            const obj = {};
            curSubjectArr.forEach(ele => {
                obj[ele] = +$("#edit-form #" + ele).val();
            });
            console.log(0)
            let pro = ajax('../updateScore', {
                id: $("#edit-form #id").val(),
                data: JSON.stringify(obj)
            });
            pro = pro.then(res => {
                console.log(res)
                if (res.status == "success") {
                    renderScoreTable();
                    alert(res.msg);
                }
            }, err => {
                alert("更新成绩失败！");
            })
        })
    }

    //重置表单
    function bindReset() {
        $('#editResetBtn').on("click", () => {
            const id = $('#edit-form #id').val();
            const name = $('#edit-form #name').val();
            // console.log(id,name)
            $("#edit-form")[0].reset();
            $('#edit-form #id').val(id);
            $('#edit-form #name').val(name);
        })
    }

    //渲染个人信息
    function renderMyInfo() {
        let pro = ajax('../myInfo', {
            id: curId
        });
        pro = pro.then(res => {
            console.log(res)
            if (res.status == "success") {
                let str = ``;
                for (const key in res.data) {
                    if (curType == "student" || (curType == "teacher" && key != "special")) {
                        const title = transformData(key);
                        let info = res.data[key];
                        if (res.data[key] == "teacher") {
                            info = "老师"
                        }
                        if (res.data[key] == "student") {
                            info = "学生"
                        }
                        str += `<div class="col-md-6 col-12">
                                    <div>
                                        <div class="title">${title}</div>
                                        <div class="info">${info}</div>
                                    </div>
                                </div>`;
                    }
                }
                $('#info-area .row').html(str);
            } else {
                alert(res.msg)
            }
        }, err => {
            alert(err)
        })
    }

    //渲染个人成绩
    function renderMyScore() {
        $('#score-area .my-score').show();
        let pro = ajax('../getMyScore', {
            id: curId
        });
        pro = pro.then(res => {
            console.log(res)
            if (res.status == 'success') {
                let str = '';
                for (const key in res.data.data) {
                    let title = key;
                    if (key == "totalScore") {
                        title = "总分"
                    }
                    str += `<div class="col-md-4 col-sm-6 col-12">
                                <div>
                                    <div class="title">${title}:</div>
                                    <div class="info">${res.data.data[key]}</div>
                                </div>
                            </div>`
                }
                $('#score-area .my-score .row').html(str)
            } else {
                $('#score-area .my-score .row').html(res.msg)
            }
        }, err => {
            $('#score-area .my-score .row').html(err);
        })
    }

    //转换后台数据name--->姓名
    function transformData(str) {
        let data = null;
        if (str == "id") {
            if (curType == "teacher") {
                data = "工号:"
            } else {
                data = "学号:"
            }
        }
        if (str == "name") {
            data = "姓名:";
        }
        if (str == "gender") {
            data = "性别:";
        }
        if (str == "classes") {
            data = "年级:";
        }
        if (str == "faculty") {
            data = "院系:";
        }
        if (str == "special") {
            data = "专业:";
        }
        if (str == "phone") {
            data = "手机号:";
        }
        if (str == "type") {
            data = "身份:";
        }
        return data;
    }


    //返回按钮
    function bindBackBtn() {
        $('#score-area .classes-back-btn .back-span').on("click", () => {
            $('#score-area .classes-area').hide();
            $('#score-area .faculty-area').show();
        })
        $('#score-area .special-back-btn .back-span').on("click", () => {
            $('#score-area .special-area').hide();
            $('#score-area .classes-area').show();
        })
        $('#score-area .score-back-btn .back-span').on("click", () => {
            $('#score-area .score-table').hide();
            $('#score-area .special-area').show();
        })
    }

    //成绩分析点击事件
    function bindEchartsBtn() {
        $('#score-area .back-btn .echarts-btn>span').on('click', () => {
            renderEcharts();
        })
    }

    //渲染成绩分析
    function renderEcharts() {
        $('#echartsMessage .modal-content .modal-body .row').html('');
        curSubjectArr.forEach(ele => {
            let pro = ajax('../scoreECharts', {
                classes: curClasses,
                special: curSpecial,
                curSubject: ele
            })
            pro = pro.then(res => {
                console.log(res)
                let str = `<div class="col-12 col-md-6" style="height: 400px; width: 100%;">
                                <div id="${res.data.subject}" style="height: 350px; width: 350px;"></div>
                            </div>`;
                $('#echartsMessage .modal-content .modal-body .row').append(str);
                const dom = $(`#echartsMessage .modal-content .modal-body .row #${res.data.subject}`).get(0);
                // console.log(dom)
                const myChart = echarts.init(dom);
                const option = {
                    title: {
                        text: `${res.data.subject}成绩分析`,
                        subtext: '纯属虚构',
                        x: 'center',
                        y: 5
                    },
                    legend: {
                        orient: 'vertical',
                        left: 0,
                        top: 5,
                        data: ['优秀', '良好', '及格', '不及格']
                    },
                    series: [{
                        name: res.data.subject + '成绩',
                        type: 'pie',
                        radius: '50%',
                        center: ['50%', '65%'],
                        data: [{
                            value: res.data.data.A,
                            name: '优秀'
                        }, {
                            value: res.data.data.B,
                            name: '良好'
                        }, {
                            value: res.data.data.C,
                            name: '及格'
                        }, {
                            value: res.data.data.D,
                            name: '不及格'
                        }]
                    }],
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a}<br/>{b} : {c}人 ({d}%)'
                    }
                };
                myChart.setOption(option);
            });
        });
    }
})();