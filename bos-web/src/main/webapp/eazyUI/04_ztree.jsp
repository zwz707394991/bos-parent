<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-63
  Date: 2018/5/8
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统管理</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/ztree/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ztree/jquery.ztree.all-3.5.js"></script>
</head>
<body class="easyui-layout">
<div title="xxxxx管理系统" style="height: 200px" data-options="region:'north'">北部布局</div>
<div title="系统管理" style="width: 200px" data-options="region:'west'">
    <%--
    fit:'true'：自适应填充
    --%>
    <div class="easyui-accordion" data-options="fit:'true'">
        <%--子模块div表示--%>
        <div data-options="iconCls:'icon-edit'" title="面板一">
            <a id="but1" class="easyui-linkbutton">添加一个选项卡</a>
            <script type="text/javascript">
                $(function () {
                    //页面加载后为but1绑定一个点击事件

                    $(but1).click(function () {
                        var e = $("#tabs1").tabs("exists", "系统操作");
                        if (e) {
                            $("#tabs1").tabs("select", "系统操作");
                        } else {
                            $("#tabs1").tabs("add", {
                                title: '系统操作',
                                iconCls: 'icon-edit',
                                closable: true,
                                content: '<iframe frameborder="0px" width="100%" height="100%" src="http://www.baidu.com"></iframe>'
                            })
                        }

                    })
                });
            </script>
        </div>
        <div title="面板二">
            <%--标准json--%>
            <ul id="ztree1" class="ztree"></ul>
            <script type="text/javascript">
                $(function () {
                    var setting = {};
                    var zNode = [
                        {
                            "name": "第一节点", "children": [
                            {"name": "节点一"},
                            {"name": "节点二"},
                            {"name": "节点三"}
                        ]
                        },
                        {"name": "第二节点"},
                        {"name": "第三节点"}
                    ];
                    $.fn.zTree.init($("#ztree1"), setting, zNode);

                })
            </script>
        </div>
        <div title="面板三">
            <ul id="ztree2" class="ztree"></ul>
            <script type="text/javascript">
                $(function () {
                    var setting2 = {
                        data: {
                            simpleData: {
                                enable: true

                            }
                        }
                    };
                    var zNode2 = [
                        {"id": 1, "pId": 2, "name": "第一节点"},
                        {"id": 2, "pId": 3, "name": "第二节点"},
                        {"id": 3, "pId": 0, "name": "第三节点"}
                    ];
                    $.fn.zTree.init($("#ztree2"), setting2, zNode2);

                })
            </script>
        </div>
        <div title="面板四">
            <ul id="ztree3" class="ztree"></ul>
            <script type="text/javascript">
                $(function () {
                    var setting2 = {
                        data: {
                            simpleData: {
                                enable: true

                            }
                            
                        },
                        callback: {
                            onClick: function (event, treeId, treeNode) {
                                if(treeNode.page!=undefined){
                                    if($("#tabs1").tabs("exists",treeNode.name)){
                                        $("#tabs1").tabs("select",treeNode.name);
                                    }else {

                                        $("#tabs1").tabs("add",{
                                            title:treeNode.name,
                                            closable:true,
                                            content:'<iframe frameborder="0" width="100%" height="100%" src="'+treeNode.page+'"></iframe>'
                                        });
                                    }

                                };

                            }
                        }
                    };
                    var url = "${pageContext.request.contextPath}/json/menu.json";
                    $.post(url, {}, function (data) {
                        $.fn.zTree.init($("#ztree3"), setting2, data);
                    }, "json");


                })
            </script>
        </div>
    </div>
</div>
<div data-options="region:'center'">
    <div id="tabs1" class="easyui-tabs" data-options="fit:'true'">
        <%--子模块div表示--%>

        <div data-options="iconCls:'icon-edit'" title="面板一">111</div>
        <div data-options="closable:true" title="面板二">111</div>
        <div title="面板三">111</div>
    </div>
</div>
<div style="width: 100px" data-options="region:'east'">东部布局</div>
<div style="height: 200px" data-options="region:'south'">南部布局</div>
</body>
</html>
