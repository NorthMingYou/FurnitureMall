<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>添加商品</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="${pageContext.request.contextPath}/GPages/admin/style/adminStyle.css" rel="stylesheet" type="text/css" />
  <script src="js/jquery.js"></script>
</head>

<body>
  <div class="wrap">
    <div class="page-title">
      <span class="modular fl">
        <i class="add"></i>
        <em>编辑产品</em>
      </span>
      <span class="modular fr">
        <a href="${pageContext.request.contextPath}/productList" class="pt-link-btn">产品列表</a>
      </span>
    </div>
    <form action="${pageContext.request.contextPath}/furniture/add" enctype="multipart/form-data" method="post">
      <table class="list-style">
        <tr>
          <td style="text-align:right;width:15%;">家具名称：</td>
          <td>
            <input type="text" class="textBox length-long" name="fname" />
          </td>
        </tr>
        <tr>
          <td style="text-align:right;">家具类型：</td>
          <td>
            <select class="textBox" name="ftype">
              <option value="床">床</option>
              <option value="沙发">沙发</option>
              <option value="椅子">椅子</option>
              <option value="桌子">桌子</option>
            </select>
          </td>
        </tr>
        <tr>
          <td style="text-align:right;">家具风格：</td>
          <td>
            <select class="textBox" name="fstyle">
              <option value="复古">复古</option>
              <option value="欧式">欧式</option>
              <option value="简约">简约</option>
              <option value="黑白">黑白</option>
            </select>
          </td>
        </tr>
        <tr>
          <td style="text-align:right;">价格:</td>
          <td>
            <input type="text" class="textBox length-short" name="fprice" />
            <span>元</span>
          </td>
        </tr>
        <!-- <tr>
      <td style="text-align:right;">优惠价：</td>
      <td>
      <input type="text" class="textBox length-short"/>
      <span>元</span>
      </td>
    </tr> -->
        <tr>
          <td style="text-align:right;">库存：</td>
          <td>
            <input type="text" class="textBox length-short" name="fnum" />
            <span>件</span>
          </td>
        </tr>
        <!-- <tr>
      <td style="text-align:right;">家具缩图片：</td>
      <td>
      <input type="file" id="suoluetu" class="hide"/>
      <label for="suoluetu" class="labelBtnAdd">+</label>
      <img src="#" width="60" height="60" class="mlr5"/>
      </td>
      <c:if test="${product.picPath!=null }">  
    <img alt="${product.name }" src="/file/${product.picPath }">  
</c:if>
    </tr> -->
        <tr>
          <td style="text-align:right;">是否显示（上下架）:</td>
          <td>
            <select class="textBox" name="isdropoff">
              <option value="1">是</option>
              <option value="0">否</option>

            </select>
          </td>
        </tr>
        <tr>
          <td style="text-align:right;">家具主图：</td>
          <td>
            <!-- <input type="file"  multiple="multiple" id="chanpinzhutu_1" class="hide"/> -->
            <label>本地上传(最多选择3张)</label>
          </td>
        </tr>
        <tr>
          <td style="text-align:right;"></td>
          <td>
            <div>
              <div id="pic1" style="width:300px; height:300px; border:1px solid hsl(209, 27%, 69%);"></div>
              <br/>
              <!-- <img src="#" width="80" height="80" id="pic1" /><br/> -->
              <input type="file" multiple="multiple" id="chanpinzhutu_1" class="hide" name="fpic" value="1" onchange="preview(this)"
              />
              <label for="chanpinzhutu_1" class="labelBtn2">选择图片1</label>

              <div style="width:300px; height:300px; border:1px solid hsl(209, 27%, 69%);" id="pic2"></div>
              <br/>
              <!-- <img src="#" width="80" height="80" id="pic2"/><br/> -->
              <input type="file" multiple="multiple" id="chanpinzhutu_2" class="hide" name="fpic" value="2" onchange="preview(this)"
              />
              <label for="chanpinzhutu_2" class="labelBtn2">选择图片2</label>

              <div style="width:300px; height:300px; border:1px solid hsl(209, 27%, 69%);" id="pic3"></div>
              <br/>
              <!-- <img src="#" width="80" height="80" id="pic3"/><br/> -->
              <input type="file" multiple="multiple" id="chanpinzhutu_3" class="hide" name="fpic" value="3" onchange="preview(this)"
              />
              <label for="chanpinzhutu_3" class="labelBtn2">选择图片3</label>
            </div>
          </td>
        </tr>

        <tr>
          <td style="text-align:right;">家具详情描述：</td>
          <td>
            <textarea class="textarea" name="fsummary">...这里直接调用文本编辑器...移除此处的“textarea”即可</textarea>
          </td>
        </tr>
        <tr>
          <td style="text-align:right;"></td>
          <td>
            <input type="submit" value="编辑完成" class="tdBtn" />
          </td>
        </tr>
      </table>
    </form>
  </div>
  <script>
    $("#btnClick").click(function () {
      var formData = new FormData();
      formData.append("username", $("#username").val());
      formData.append("file", $("#userface")[0].files[0]);
      $.ajax({
        url: '/fileupload',
        type: 'post',
        data: formData,
        processData: false,
        contentType: false,
        success: function (msg) {
          alert(msg);
        }
      });
    });
    function preview(file) {

      var aa = file.getAttribute("value");
      var did = 'pic' + aa;
      var prevDiv = document.getElementById(did);
      if (file.files && file.files[0]) {
        var reader = new FileReader();
        reader.onload = function (evt) {
          //$("#pic1").attr("src",evt.target.result);
          prevDiv.innerHTML = '<img  width="300" height="300" src="' + evt.target.result + '" />';
        }
        reader.readAsDataURL(file.files[0]);
      } else {
        // $("#pic1").css("filter",'progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'');
        // $("#pic1").attr("src",evt.target.result);
        prevDiv.innerHTML = '<div class="img" width="300" height="300" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
      }
    }
  </script>

</body>

</html>