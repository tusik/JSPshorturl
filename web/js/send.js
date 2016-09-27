/**
 * Created by zinc on 2016/9/26.
 */
var xmlhttp;
function sendurl(){
    var value = document.getElementById("url").value;
    if(value!=null&&value.toUpperCase().match("(HTTP://|HTTPS://)")){
        //兼容性写法创建请求实例,IE5 6支持else里面的方法
        if (window.XMLHttpRequest){
            xmlhttp = new XMLHttpRequest();
        }else {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
//设置传送方式,地址,以及同步还是异步
        xmlhttp.open("GET","in.jsp?value="+escape(value),false);
        xmlhttp.onreadystatechange = callback;//状态改变的时候执行这个函数,用来判断是否请求完毕
        xmlhttp.send();//请求服务器
    }
}
function callback(){
//请求完成表示
    if(xmlhttp.readyState ==4 && xmlhttp.status==200){
        //alert(xmlhttp.responseText);//相应返回的text
// alert(xmlhttp.responseXML);//相应返回的xml
        if (xmlhttp.responseText!=null){//这里直接判断不为空,应该根据数据库返回值来进行不同的显示
            var spanid = document.getElementById("surl");
            if(location.port!=80){
                var url="http://"+document.domain+":"+location.port+"/u/"+xmlhttp.responseText;
            }else {
                var url="http://"+document.domain+"/u/"+xmlhttp.responseText;
            }
            spanid.innerHTML ='<a href=\"'+url+'\">'+url+'</a>';
        }
    }
    return false;
}
function submitbtn_click(){
    return false;//阻止提交
}