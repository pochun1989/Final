<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldMedicine_Add.aspx.cs" Inherits="WebPro.GA.less.OldMedicine_Add" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>  
<title>GuardianAngel 用藥提醒</title>
<meta name="description" content=""/>
<meta name="viewport" content="width=device-width"/>
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<!--css連結old-->
    <!-- Bootstrap core CSS -->
     <link href="css/bootstrap.min.css" rel="stylesheet"/>
     <link href="css/bootstrap_02.css" rel="stylesheet"/>

    <!-- Custom fonts for this template -->
    <link href="css/GaCare.css" rel="stylesheet" type="text/css"/>
    <link href="css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'/>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="css/agency_inside.css" rel="stylesheet"/> 
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="css/JCSS.css"/> 


    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="jquery-ui-1.11.2/datepicker-zh-TW.js"></script>
    <script src="js/JJS2.js"></script>

</head>
<body style="font-family:'微軟正黑體';">
  <!-- Navigation導覽列 -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="Homepage.aspx">Guardian Angel</a>
         <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">         
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="hintindex.aspx">溫馨小語</a>
            </li>          
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="respondindexV3.aspx">異常紀錄</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="#">GPS</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="GaCare.aspx">守護對象資料</a>
            </li>
             <li class="nav-item nav-item dropdown">
              <a class="nav-link dropdown-toggle"  href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%Response.Write(Session["Uname"]);%>您好</a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
                      <a class="dropdown-item" href="MemberArea.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >會員資料</a>
                      <a class="dropdown-item" href="MemPasUpd01.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';">更改密碼</a>
                      <a class="dropdown-item" href="index.aspx" onclick="signOut()" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';">登出</a>
                  </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>

     <!-- 請輸入自己的 -->
    <section id="testR7">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">新 增 藥 包</h2>
            <h3 class="section-subheading text-muted">Add medicine package</h3>
          </div>
        </div>
       </div>      
    </section>

            <div class="rwd" style="margin-top:-180px;">
                 <p class="j-title"  ><strong>新增藥包</strong></p>
       <form id="careForm" runat="server">
           <span>
               <asp:ScriptManager ID="ScriptManager1" runat="server">
                                  </asp:ScriptManager>
           </span>
           <table class="j-table"> 
              
                    <tr>
                        <td class="tableTitleFont">守護對象姓名</td>
                        <td class="tableCFont">
                                  <asp:Label ID="lblOlderName" runat="server" BackColor="White" Width="100%"></asp:Label>
                                  
                        </td>
                    </tr>
                     <tr>
                        <td class="tableTitleFont">藥包名稱</td>
                        <td class="auto-style4">   
                                <asp:TextBox ID="tbNname" runat="server" Width="95%"></asp:TextBox>
                         </td>
                    </tr>
                     <tr>
                        <td class="tableTitleFont">新增用藥時間</td>
                        <td class="tableCFont">   
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                  <ContentTemplate>
                                       <asp:Button ID="btnAddTime" runat="server" Font-Size="100%" OnClick="btnAddTime_Click" Text="+ 新增用藥時間" Width="100%" />
                                            <asp:Panel ID="Panel1" runat="server">
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                            <asp:ListItem Value="0"></asp:ListItem>
                                            <asp:ListItem Value="1"></asp:ListItem>
                                            <asp:ListItem Value="2"></asp:ListItem>
                                            <asp:ListItem Value="3"></asp:ListItem>
                                            <asp:ListItem Value="4"></asp:ListItem>
                                            <asp:ListItem Value="5"></asp:ListItem>
                                            <asp:ListItem Value="6"></asp:ListItem>
                                            <asp:ListItem Value="7"></asp:ListItem>
                                            <asp:ListItem Value="8"></asp:ListItem>
                                            <asp:ListItem Value="9"></asp:ListItem>
                                            <asp:ListItem Value="10"></asp:ListItem>
                                            <asp:ListItem Value="11"></asp:ListItem>
                                            <asp:ListItem Value="12"></asp:ListItem>
                                            <asp:ListItem Value="13"></asp:ListItem>
                                            <asp:ListItem Value="14"></asp:ListItem>
                                            <asp:ListItem Value="15"></asp:ListItem>
                                            <asp:ListItem Value="16"></asp:ListItem>
                                            <asp:ListItem Value="17"></asp:ListItem>
                                            <asp:ListItem Value="18"></asp:ListItem>
                                            <asp:ListItem Value="19"></asp:ListItem>
                                            <asp:ListItem Value="20"></asp:ListItem>
                                            <asp:ListItem Value="21"></asp:ListItem>
                                            <asp:ListItem Value="22"></asp:ListItem>
                                            <asp:ListItem Value="23"></asp:ListItem>
                                        </asp:DropDownList>
                                                時<asp:DropDownList ID="DropDownList2" runat="server" >
                                            <asp:ListItem Value="00"></asp:ListItem>
                                            <asp:ListItem Value="30"></asp:ListItem>
                                        </asp:DropDownList>
                                                分
                                        <asp:Button ID="btnSetTimeCancel1" runat="server" CssClass="gillButton" Font-Bold="True" Font-Size="Medium" Height="40px" Width="80px"  OnClick="btnSetTimeCancel1_Click" Text="取消" />
                                    </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" Width="100%">
                                &nbsp;<asp:DropDownList ID="DropDownList3" runat="server">
                                          <asp:ListItem Value="0"></asp:ListItem>
                                          <asp:ListItem Value="1"></asp:ListItem>
                                          <asp:ListItem Value="2"></asp:ListItem>
                                          <asp:ListItem Value="3"></asp:ListItem>
                                          <asp:ListItem Value="4"></asp:ListItem>
                                          <asp:ListItem Value="5"></asp:ListItem>
                                          <asp:ListItem Value="6"></asp:ListItem>
                                          <asp:ListItem Value="7"></asp:ListItem>
                                          <asp:ListItem Value="8"></asp:ListItem>
                                          <asp:ListItem Value="9"></asp:ListItem>
                                          <asp:ListItem Value="10"></asp:ListItem>
                                          <asp:ListItem Value="11"></asp:ListItem>
                                          <asp:ListItem Value="12"></asp:ListItem>
                                          <asp:ListItem Value="13"></asp:ListItem>
                                          <asp:ListItem Value="14"></asp:ListItem>
                                          <asp:ListItem Value="15"></asp:ListItem>
                                          <asp:ListItem Value="16"></asp:ListItem>
                                          <asp:ListItem Value="17"></asp:ListItem>
                                          <asp:ListItem Value="18"></asp:ListItem>
                                          <asp:ListItem Value="19"></asp:ListItem>
                                          <asp:ListItem Value="20"></asp:ListItem>
                                          <asp:ListItem Value="21"></asp:ListItem>
                                          <asp:ListItem Value="22"></asp:ListItem>
                                          <asp:ListItem Value="23"></asp:ListItem>
                                      </asp:DropDownList>時<asp:DropDownList ID="DropDownList4" runat="server" >
                                          <asp:ListItem Value="00"></asp:ListItem>
                                          <asp:ListItem Value="30"></asp:ListItem>
                                      </asp:DropDownList>
                                                                          分&nbsp;<asp:Button ID="btnSetTimeCancel2" CssClass="gillButton" runat="server" Font-Bold="True" Font-Size="Medium" Height="40px" Width="80px"  OnClick="btnSetTimeCancel2_Click" Text="取消" />
                                                                          &nbsp;
                            
                            </asp:Panel>
                            <asp:Panel ID="Panel3" runat="server" Width="100%">
                          
                                     <asp:DropDownList ID="DropDownList5" runat="server">
                                          <asp:ListItem Value="0"></asp:ListItem>
                                          <asp:ListItem Value="1"></asp:ListItem>
                                          <asp:ListItem Value="2"></asp:ListItem>
                                          <asp:ListItem Value="3"></asp:ListItem>
                                          <asp:ListItem Value="4"></asp:ListItem>
                                          <asp:ListItem Value="5"></asp:ListItem>
                                          <asp:ListItem Value="6"></asp:ListItem>
                                          <asp:ListItem Value="7"></asp:ListItem>
                                          <asp:ListItem Value="8"></asp:ListItem>
                                          <asp:ListItem Value="9"></asp:ListItem>
                                          <asp:ListItem Value="10"></asp:ListItem>
                                          <asp:ListItem Value="11"></asp:ListItem>
                                          <asp:ListItem Value="12"></asp:ListItem>
                                          <asp:ListItem Value="13"></asp:ListItem>
                                          <asp:ListItem Value="14"></asp:ListItem>
                                          <asp:ListItem Value="15"></asp:ListItem>
                                          <asp:ListItem Value="16"></asp:ListItem>
                                          <asp:ListItem Value="17"></asp:ListItem>
                                          <asp:ListItem Value="18"></asp:ListItem>
                                          <asp:ListItem Value="19"></asp:ListItem>
                                          <asp:ListItem Value="20"></asp:ListItem>
                                          <asp:ListItem Value="21"></asp:ListItem>
                                          <asp:ListItem Value="22"></asp:ListItem>
                                          <asp:ListItem Value="23"></asp:ListItem>
                                      </asp:DropDownList>
                                      時<asp:DropDownList ID="DropDownList6" runat="server" >
                                          <asp:ListItem Value="00"></asp:ListItem>
                                          <asp:ListItem Value="30"></asp:ListItem>
                                      </asp:DropDownList>
                                      分
                                      <asp:Button ID="btnSetTimeCancel3" CssClass="gillButton" runat="server" Font-Bold="True" Font-Size="Medium" Height="40px" Width="80px"  OnClick="btnSetTimeCancel3_Click" Text="取消" />
                       
                            </asp:Panel>
                            <asp:Panel ID="Panel4" runat="server" Width="100%">
                         
                                     <asp:DropDownList ID="DropDownList7" runat="server">
                                          <asp:ListItem Value="0"></asp:ListItem>
                                          <asp:ListItem Value="1"></asp:ListItem>
                                          <asp:ListItem Value="2"></asp:ListItem>
                                          <asp:ListItem Value="3"></asp:ListItem>
                                          <asp:ListItem Value="4"></asp:ListItem>
                                          <asp:ListItem Value="5"></asp:ListItem>
                                          <asp:ListItem Value="6"></asp:ListItem>
                                          <asp:ListItem Value="7"></asp:ListItem>
                                          <asp:ListItem Value="8"></asp:ListItem>
                                          <asp:ListItem Value="9"></asp:ListItem>
                                          <asp:ListItem Value="10"></asp:ListItem>
                                          <asp:ListItem Value="11"></asp:ListItem>
                                          <asp:ListItem Value="12"></asp:ListItem>
                                          <asp:ListItem Value="13"></asp:ListItem>
                                          <asp:ListItem Value="14"></asp:ListItem>
                                          <asp:ListItem Value="15"></asp:ListItem>
                                          <asp:ListItem Value="16"></asp:ListItem>
                                          <asp:ListItem Value="17"></asp:ListItem>
                                          <asp:ListItem Value="18"></asp:ListItem>
                                          <asp:ListItem Value="19"></asp:ListItem>
                                          <asp:ListItem Value="20"></asp:ListItem>
                                          <asp:ListItem Value="21"></asp:ListItem>
                                          <asp:ListItem Value="22"></asp:ListItem>
                                          <asp:ListItem Value="23"></asp:ListItem>
                                      </asp:DropDownList>
                                      時<asp:DropDownList ID="DropDownList8" runat="server" >
                                          <asp:ListItem Value="00"></asp:ListItem>
                                          <asp:ListItem Value="30"></asp:ListItem>
                                      </asp:DropDownList>
                                      分
                                      <asp:Button ID="btnSetTimeCancel4" CssClass="gillButton" runat="server" Font-Bold="True" Font-Size="Medium" Height="40px" Width="80px"  OnClick="btnSetTimeCancel4_Click" Text="取消" />
                       
                            </asp:Panel>
                            <asp:Panel ID="Panel5" runat="server" Width="100%">
                  
                                    <asp:DropDownList ID="DropDownList9" runat="server">
                                          <asp:ListItem Value="0"></asp:ListItem>
                                          <asp:ListItem Value="1"></asp:ListItem>
                                          <asp:ListItem Value="2"></asp:ListItem>
                                          <asp:ListItem Value="3"></asp:ListItem>
                                          <asp:ListItem Value="4"></asp:ListItem>
                                          <asp:ListItem Value="5"></asp:ListItem>
                                          <asp:ListItem Value="6"></asp:ListItem>
                                          <asp:ListItem Value="7"></asp:ListItem>
                                          <asp:ListItem Value="8"></asp:ListItem>
                                          <asp:ListItem Value="9"></asp:ListItem>
                                          <asp:ListItem Value="10"></asp:ListItem>
                                          <asp:ListItem Value="11"></asp:ListItem>
                                          <asp:ListItem Value="12"></asp:ListItem>
                                          <asp:ListItem Value="13"></asp:ListItem>
                                          <asp:ListItem Value="14"></asp:ListItem>
                                          <asp:ListItem Value="15"></asp:ListItem>
                                          <asp:ListItem Value="16"></asp:ListItem>
                                          <asp:ListItem Value="17"></asp:ListItem>
                                          <asp:ListItem Value="18"></asp:ListItem>
                                          <asp:ListItem Value="19"></asp:ListItem>
                                          <asp:ListItem Value="20"></asp:ListItem>
                                          <asp:ListItem Value="21"></asp:ListItem>
                                          <asp:ListItem Value="22"></asp:ListItem>
                                          <asp:ListItem Value="23"></asp:ListItem>
                                      </asp:DropDownList>
                                      時<asp:DropDownList ID="DropDownList10" runat="server" >
                                          <asp:ListItem Value="00"></asp:ListItem>
                                          <asp:ListItem Value="30"></asp:ListItem>
                                      </asp:DropDownList>
                                      分
                                      <asp:Button ID="btnSetTimeCancel5" CssClass="gillButton" runat="server" Font-Bold="True" Font-Size="Medium" Height="40px" Width="80px"  OnClick="btnSetTimeCancel5_Click" Text="取消" />
                            </asp:Panel>     
                                       </ContentTemplate>
                                  </asp:UpdatePanel>
                            
                         </td>
                    </tr>
                    <tr>
                        <td class="tableTitleFont">開始日期</td>
                        <td class="tableCFont">
                            <asp:TextBox ID="txtStartDate" runat="server" Width ="100%"
                             OnFocus="javascript:if(this.value=='') {this.value='若手動輸入，格式範例：2019/02/22'}"
                             OnBlur="javascript:if(this.value==''){this.value='若手動輸入，格式範例：2019/02/22'}"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableTitleFont">結束日期</td>
                        <td class="tableCFont">
                            <asp:TextBox ID="txtEndDate" runat="server" Width ="100%"
                             OnFocus="javascript:if(this.value=='') {this.value='若手動輸入，格式範例：2019/02/22'}"
                             OnBlur="javascript:if(this.value==''){this.value='若手動輸入，格式範例：2019/02/22'}"></asp:TextBox>
                        </td>
                    </tr>
                   <tr>
                       <td colspan="2" class="auto-style3_1">
                         
                      <asp:Button ID="btnOK" runat="server"  CssClass="gillButton"  Font-Bold="True" Font-Size="Medium" Height="40px" Width="80px" OnClick="btnOK_Click" Text="新增" Font-Names="微軟正黑體" />
                      &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server"  CssClass="gillButton"  Font-Bold="True" Font-Size="Medium" Height="40px" Width="80px" OnClick="btnCancel_Click" Text="返回" Font-Names="微軟正黑體" /> 
                           &nbsp; 
                           </td>
                          </tr>
              </table>
    </form>
                </div>
  <!--主頁END-->
     <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; 2018 Guardian Angel</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="service list-inline-item ">
                服務電話 : 07-351-2345 (10AM-6PM)
              </li>               
            </ul>
          </div>
        </div>
      </div>
    </footer>
    <!-- Bootstrap core JavaScript -->
   <%-- <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>--%>
    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>
</body>
</html>
