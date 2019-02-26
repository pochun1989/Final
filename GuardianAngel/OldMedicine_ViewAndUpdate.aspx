<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldMedicine_ViewAndUpdate.aspx.cs" Inherits="GuardianAngel.OldMedicine_ViewAndUpdate" %>

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
    <link href="css/OldMedicine_ViewAndUpdate.css" rel="stylesheet" type="text/css" />

    
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/JCSS.css"/>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="jquery-ui-1.11.2/datepicker-zh-TW.js"></script>
    <script src="js/JJS.js"></script>


<!--圖片放大顯示-->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.fancybox.js"></script>
    <link href="css/jquery.fancybox.css" rel="stylesheet" />
    <script type="text/javascript">

        $(".forPopup").fancybox({
            'openEffect': 'elastic',
            'closeEffect': 'elastic',
            'helpers': {   
                        'title': { 'type': 'inside' },
                        'overlay': {
                            'css': { 'background': 'rgba(238,238,238)' }
                        }
                    }
        });

        $(".various").fancybox({
            maxWidth: 400,
            maxHeight: 300,
            fitToView: false,
            width: '70%',
            height: '70%',
            autoSize: false,
            closeClick: false,
            openEffect: 'none',
            closeEffect: 'none'
        });

         $(".various2").fancybox({
            maxWidth: '80%',
            maxHeight: '100%',
            fitToView: false,
            width: '100%',
            height: '100%',
            autoSize: false,
            autoScale: false,
            autoSize   : true,
            autoHeight : false,
            autoWidth  : false,
            closeClick: false,
            openEffect: 'none',
            closeEffect: 'none',
            'afterClose': function() { 
            parent.location.reload(true); 
            } 
        });
    </script>
<!--圖片放大顯示END-->

</head>

<body class="aaa">
     <form id="careForm" runat="server" >
         <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
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
              <a class="nav-link js-scroll-trigger"  href="respondindexV3.aspx">
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="display:inline;">
                      <ContentTemplate>
                          <asp:Timer ID="Timer1" runat="server" Enabled="true" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                          <asp:Label ID="lblBell" runat="server" CssClass="fas fa-bell" style=" color:crimson; "></asp:Label>
                      </ContentTemplate>
                  </asp:UpdatePanel>
                  異常紀錄</a>
            </li>           
             <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="GaCare.aspx">被照護者列表</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger"  href="GaCare_Update.aspx">
                  <% Response.Write(Session["Oldname"].ToString()+"資料"); %></a>
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
            <h2 class="section-heading text-uppercase">藥 包 資 訊</h2>
            <h3 class="section-subheading text-muted">Medicine Pakage Information</h3>
          </div>
        </div>
       </div>      
    </section>
    
    <!--主頁內容-->
    
         <div class="rwd btp">
                <table class="table" >
                    <tr>
                       <td class="tableTitleFont" style="vertical-align:middle">
                           守護者姓名</td>
                       <td class="tableFont">
                                   <asp:TextBox ID="txtName" runat="server" Height="90%"  Width="95%" Font-Size="150%" Enabled="False" ForeColor="Black"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td class="tableTitleFont" style="vertical-align:middle">
                           藥包名稱</td>
                       <td class="tableFont">            
                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtMedicineName" runat="server" Height="90%" Width="95%" Font-Size="150%" ForeColor="Black" Enabled="False"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <br />
                        </td>
                   </tr>
                   <tr>
                       <td class="tableTitleFont" style="vertical-align:middle">
                           開始日期</td>
                       <td class="tableFont">
                                  <asp:TextBox ID="txtStartDate" runat="server" Height="90%" Width="95%" Font-Size="150%"
                             OnFocus="javascript:if(this.value=='') {this.value='若手動輸入，格式範例：2019/02/22'}"
                             OnBlur="javascript:if(this.value==''){this.value='若手動輸入，格式範例：2019/02/22'}" ForeColor="Black" Enabled="False"></asp:TextBox>
                        </td>
                   </tr>
                   <tr>
                       <td class="tableTitleFont" style="vertical-align:middle">
                           結束日期</td>
                       <td class="tableFont">
                                 <asp:TextBox ID="txtEndDate" runat="server" Height="90%" Width="95%" Font-Size="150%"
                             OnFocus="javascript:if(this.value=='') {this.value='若手動輸入，格式範例：2019/02/22'}"
                             OnBlur="javascript:if(this.value==''){this.value='若手動輸入，格式範例：2019/02/22'}" ForeColor="Black" Enabled="False"></asp:TextBox>
                        </td>
                   </tr>
                   <tr>
                       <td class="auto-style6" colspan="2">
                                   &nbsp;<asp:Button ID="btnEdit" runat="server" CssClass="gillButton" Font-Bold="True" Font-Names="微軟正黑體"  Font-Size="Medium"  Height="40px" Width="80px" OnClick="btnEdit_Click" Text="修改" />
                                   &nbsp;&nbsp;
                                   <asp:Button ID="btnSure" runat="server" CssClass="gillButton" Font-Bold="True" Font-Names="微軟正黑體"  Font-Size="Medium"  Height="40px" Width="80px" OnClick="btnSure_Click" Text="更新" ToolTip="更新基本資料" />
                               </td>
                   </tr>
                   <tr>
                       <td class="tableTitleFont" style="vertical-align:middle">
                           用藥時間<br />
                           <asp:ImageButton ID="btnAddTime" runat="server" ImageUrl="~/img/icon/plus.png" Height="50px" Width="50px" OnClick="btnAddTime_Click1" ToolTip="新增用藥時間" />
                           &nbsp;<br />
                       </td>
                       <td class="tableFont">
                           <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                <ContentTemplate>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Guardian_Angel %>" SelectCommand="SELECT * FROM [Time] WHERE ([N_id] = @N_id) order by convert(int,[T_hour]),convert(int,[T_minute])" DeleteCommand="DELETE FROM [Time] WHERE [T_id] = @T_id" InsertCommand="INSERT INTO [Time] ([T_hour], [T_minute], [N_id]) VALUES (@T_hour, @T_minute, @N_id)" UpdateCommand="UPDATE [Time] SET [T_hour] = @T_hour, [T_minute] = @T_minute, [N_id] = @N_id WHERE [T_id] = @T_id" OnInserted="SqlDataSource2_Inserted">
                                    <DeleteParameters>
                                        <asp:Parameter Name="T_id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="T_hour" Type="String" />
                                        <asp:Parameter Name="T_minute" Type="String" />
                                        <asp:Parameter Name="N_id" Type="Int32" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="1" Name="N_id" SessionField="nId" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="T_hour" Type="String" />
                                        <asp:Parameter Name="T_minute" Type="String" />
                                        <asp:Parameter Name="N_id" Type="Int32" />
                                        <asp:Parameter Name="T_id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="gdStyle" DataKeyNames="T_id" DataSourceID="SqlDataSource2" Width="70%" OnRowCommand="GridView2_RowCommand" >
                                        <Columns>
                                            <asp:TemplateField HeaderText="修改" ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Edit" Height="20px" ImageUrl="~/img/edit2.png" Width="20px" />
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("T_id") %>' Visible="False"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="刪除" ShowHeader="False">
                                                <ItemTemplate>
                                                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" CommandName="Delete" Height="28px" ImageUrl="~/img/icon/picdelete.png" OnClientClick="return confirm('確定要刪除嗎?')" ToolTip="刪除該筆資料" />
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("N_id") %>' Visible="False"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="T_hour" HeaderText="時" SortExpression="T_hour" />
                                            <asp:BoundField DataField="T_minute" HeaderText="分" SortExpression="T_minute" />
                                        </Columns>
                                        <HeaderStyle BackColor="#A2CD5A" Font-Names="新細明體" Font-Size="Large" ForeColor="White" />
                                        <RowStyle Font-Size="Small" ForeColor="Black" />
                                    </asp:GridView>
                                </ContentTemplate>
                           </asp:UpdatePanel>
                           <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                               <ContentTemplate>
                                                                       <br />
                                                                       &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style4" Width="70px">
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
                                   &nbsp;&nbsp;
                                    <asp:Label ID="lblHour" runat="server" CssClass="auto-style5" Text="時"></asp:Label>
                                                                       &nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style4" Width="70px">
                                    <asp:ListItem Value="00"></asp:ListItem>
                                    <asp:ListItem Value="10"></asp:ListItem>
                                    <asp:ListItem Value="20"></asp:ListItem>
                                    <asp:ListItem Value="30"></asp:ListItem>
                                    <asp:ListItem Value="40"></asp:ListItem>
                                    <asp:ListItem Value="50"></asp:ListItem>
                                    </asp:DropDownList>
                                   &nbsp;&nbsp;
                                    <asp:Label ID="lblMinute" runat="server" CssClass="auto-style5" Text="分"></asp:Label>
                                                                       &nbsp;&nbsp; &nbsp;<asp:Button ID="btnSendTime" CssClass="gillButton" runat="server" Text="送出" OnClick="btnSendTime_Click" Font-Bold="True" Font-Names="微軟正黑體"  Font-Size="Medium"  Height="40px" Width="80px" ToolTip="送出用藥時間" Visible="False" />

                              </ContentTemplate>
                           </asp:UpdatePanel>
                       </td>
                   </tr>
                    <tr>
                       <td class="auto-style2" colspan="2">
                           &nbsp;</td>
                   </tr>
                    <tr >
                       <td class="tableTitleFont"  style="border-top:3px solid #A2CD5A; vertical-align:middle" colspan="2">藥品資訊</td>
                    </tr>
                   <tr><td colspan="2"  class="auto-style2">
                               <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                   <ContentTemplate>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Guardian_Angel %>" SelectCommand="SELECT B.P_id, B.P_name, A.P_number, B.P_remark, B.P_photo FROM NPGrouping AS A INNER JOIN Pill AS B ON A.P_id = B.P_id INNER JOIN Notice AS C ON C.N_id = A.N_id WHERE (A.N_id = @N_id)">
                          <SelectParameters>
                              <asp:SessionParameter Name="N_id" SessionField="nId" />
                          </SelectParameters>
                       </asp:SqlDataSource> 
                                       <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" CssClass="gdStyle" DataKeyNames="P_id" DataSourceID="SqlDataSource1" Font-Size="Medium" horizontalalign="Center" ShowHeaderWhenEmpty="True" style="background: rgba(90%,90%,90%,0.5);" Width="100%" Font-Names="微軟正黑體" ForeColor="#003300">
                                           <AlternatingRowStyle horizontalalign="Center" />
                                           <Columns>
                                               <asp:TemplateField HeaderText="刪除" InsertVisible="False" SortExpression="P_id">
                                                   <EditItemTemplate>
                                                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("P_id") %>'></asp:Label>
                                                   </EditItemTemplate>
                                                   <ItemTemplate>
                                                       <span class="auto-style31"/>&nbsp;<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                                       &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("P_id") %>'></asp:Label>
                                                       </span>
                                                   </ItemTemplate>
                                                   <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                   <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                               </asp:TemplateField>
                                               <asp:BoundField DataField="P_name" HeaderText="名稱" SortExpression="P_name">
                                               <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                               <ItemStyle HorizontalAlign="Left" />
                                               </asp:BoundField>
                                               <asp:BoundField DataField="P_number" HeaderText="數量" SortExpression="P_number">
                                               <ItemStyle HorizontalAlign="Center" />
                                               </asp:BoundField>
                                               <asp:TemplateField HeaderText="注意事項">
                                                   <ItemTemplate>
                                                       <asp:HyperLink ID="HyperLink1" runat="server" class="various fancybox.iframe" NavigateUrl='<%# Eval("P_id", "OldMedicine_PillRemark.aspx?pid={0}") %>'>
                                                   <asp:Image ID="Image2" height="40px"  width="40px" runat="server" ImageUrl="img\icon\notice.png" />
                                               </asp:HyperLink>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:TemplateField HeaderText="藥品照片">
                                                   <EditItemTemplate>
                                                       <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("P_photo") %>'></asp:TextBox>
                                                   </EditItemTemplate>
                                                   <ItemTemplate>
                                                       <asp:HyperLink ID="deal_VCUCSS" runat="server">
                                                  <a id="ahrefclick" class="forPopup"  href="img/p/<%#Eval("P_photo")%>">
                                                      <asp:Image ID="Image1" runat="server"  height="45px"  width="72px" ToolTip="放大顯示" ImageUrl='<%# Eval("P_photo", "~/img/p/{0}") %>' />
                                                  </a>
                                               </asp:HyperLink>
                                                   </ItemTemplate>
                                               </asp:TemplateField>
                                           </Columns>
                                           <EditRowStyle ForeColor="#003300" />
                                           <EmptyDataRowStyle ForeColor="Red" />
                                           <EmptyDataTemplate>
                                               抱歉!!!沒有找到任何紀錄~
                                           </EmptyDataTemplate>
                                           <HeaderStyle BackColor="#A2CD5A" Font-Bold="True" Font-Size="Large" Font-Names="新細明體" ForeColor="#003300" />
                                           <RowStyle Font-Names="微軟正黑體" Font-Size="Medium" />
                                       </asp:GridView>
                                       
                                       <br />
                                       <asp:Button ID="btnDelete" CssClass="gillButton" runat="server" Font-Bold="True" Font-Names="微軟正黑體"  Font-Size="Medium"  Height="40px" Width="80px" Text="刪除" OnClick="btnDelete_Click" ToolTip="刪除藥品" />
                       &nbsp;<a id="ahrefclick" class="various2 fancybox.iframe"  href="OldMedicine_AddPill.aspx"><asp:Button ID="btnAdd" CssClass="gillButton" runat="server" Font-Bold="True" Font-Names="微軟正黑體"  Font-Size="Medium"  Height="40px" Width="80px"  Text="新增" OnClick="btnAdd_Click" ToolTip="新增藥品" />
                         </a>
                                        &nbsp;<asp:Button ID="Button3" CssClass="gillButton" runat="server" Font-Bold="True" Font-Names="微軟正黑體"  Font-Size="Medium"  Height="40px" Width="80px"  Text="返回" OnClick="btnBack" ToolTip="返回上一頁" />
                                   </ContentTemplate>
                               </asp:UpdatePanel>
                       </td>
                   </tr>
              </table>
             </div>
         </form>
   <!--主頁END-->
    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; 2018 Guardian Angelspan>
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
                 服務電話 : 07-351-2345 (10:00AM-18:00PM)
              </li>               
            </ul>
          </div>
        </div>
      </div>
    </footer>
      <!-- Bootstrap core JavaScript -->
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>
</body>
</html>