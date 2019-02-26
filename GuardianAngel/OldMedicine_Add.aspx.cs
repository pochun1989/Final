using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPro.GA.less
{
    public partial class OldMedicine_Add : System.Web.UI.Page
    {
        int oid;
        int uid;
        //string filename;
        protected void Page_Load(object sender, EventArgs e)
        {
            oid = Convert.ToInt32(Session["oId"]);
            uid = Convert.ToInt32(Session["uId"]);
            if (uid == 0)
            {
                Server.Transfer("Login.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                    Panel5.Visible = false;
                    dbLoad();
                }
            }
        }

        protected void dbLoad()
        {
            SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True;");
            con.Open();
            //string strSQL = "select distinct [O_name] from [dbo].[Notice] a join [dbo].[Oldman_Data] b on a.O_id=b.O_id where a.O_id=" + oid;
            string strSQL = "select [O_name] from [dbo].[Oldman_Data] where O_id=" + oid;
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataReader reader = cmd.ExecuteReader();
            string strMsg = "";
            while (reader.Read() == true)
            {
                strMsg += string.Format("{0}", reader["O_name"]);
            }
            lblOlderName.Text = strMsg;
            reader.Close();
            con.Close();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            string myMessage = "";
            string myStr = "";
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True;";
            myMessage += oid + ",";
            myMessage += "'" + tbNname.Text + "',";
            myMessage += "'" + txtStartDate.Text + "',";
            myMessage += "'" + txtEndDate.Text + "')";

            if (tbNname.Text.Equals("")) { btnOK.Attributes["OnClick"] = "return confirm('請先確定藥包名稱')"; return; }
            if (Panel1.Visible == true && Panel2.Visible == true && Panel3.Visible == true && Panel4.Visible == true && Panel5.Visible == true)
            {
                myStr += DropDownList1.SelectedValue.ToString() + ",";
                myStr += DropDownList2.SelectedValue.ToString() + ",";
                myStr += "@i),(";
                myStr += DropDownList3.SelectedValue.ToString() + ",";
                myStr += DropDownList4.SelectedValue.ToString() + ",";
                myStr += "@i),(";
                myStr += DropDownList5.SelectedValue.ToString() + ",";
                myStr += DropDownList6.SelectedValue.ToString() + ",";
                myStr += "@i),(";
                myStr += DropDownList7.SelectedValue.ToString() + ",";
                myStr += DropDownList8.SelectedValue.ToString() + ",";
                myStr += "@i),(";
                myStr += DropDownList9.SelectedValue.ToString() + ",";
                myStr += DropDownList10.SelectedValue.ToString() + ",";
                myStr += "@i)";
            }
            else if (Panel1.Visible == true && Panel2.Visible == true && Panel3.Visible == true && Panel4.Visible == true)
            {
                myStr += DropDownList1.SelectedValue.ToString() + ",";
                myStr += DropDownList2.SelectedValue.ToString() + ",";
                myStr += "@i),(";
                myStr += DropDownList3.SelectedValue.ToString() + ",";
                myStr += DropDownList4.SelectedValue.ToString() + ",";
                myStr += "@i),(";
                myStr += DropDownList5.SelectedValue.ToString() + ",";
                myStr += DropDownList6.SelectedValue.ToString() + ",";
                myStr += "@i),(";
                myStr += DropDownList7.SelectedValue.ToString() + ",";
                myStr += DropDownList8.SelectedValue.ToString() + ",";
                myStr += "@i)";
            }
            else if (Panel1.Visible == true && Panel2.Visible == true && Panel3.Visible == true)
            {
                myStr += DropDownList1.SelectedValue.ToString() + ",";
                myStr += DropDownList2.SelectedValue.ToString() + ",";
                myStr += "@i),(";
                myStr += DropDownList3.SelectedValue.ToString() + ",";
                myStr += DropDownList4.SelectedValue.ToString() + ",";
                myStr += "@i),(";
                myStr += DropDownList5.SelectedValue.ToString() + ",";
                myStr += DropDownList6.SelectedValue.ToString() + ",";
                myStr += "@i)";
            }
            else if (Panel1.Visible == true && Panel2.Visible == true)
            {
                myStr += DropDownList1.SelectedValue.ToString() + ",";
                myStr += DropDownList2.SelectedValue.ToString() + ",";
                myStr += "@i),(";
                myStr += DropDownList3.SelectedValue.ToString() + ",";
                myStr += DropDownList4.SelectedValue.ToString() + ",";
                myStr += "@i)";
            }
            else if (Panel1.Visible == true)
            {
                myStr += DropDownList1.SelectedValue.ToString() + ",";
                myStr += DropDownList2.SelectedValue.ToString() + ",";
                myStr += "@i)";
            }
            else
            {
                btnOK.Attributes["OnClick"] = "return confirm('請至少設定一組用藥時間')";               
                return;
            }
            if (txtStartDate.Text.Equals("")) { btnOK.Attributes["OnClick"] = "return confirm('請選擇服藥日期')"; return; }
            if (txtEndDate.Text.Equals("")) { btnOK.Attributes["OnClick"] = "return confirm('請選擇服藥日期')"; return; }
            sds.InsertCommand = "insert into [dbo].[Notice]([O_id],[N_name],[N_startdate],[N_enddate])values(" + myMessage +
                    ";declare @i int; select @i = max([N_id]) from[dbo].[Notice]; insert into Time(T_hour, T_minute, N_id) values(" + myStr;
            sds.Insert();
            Response.Redirect("OldMedicine_List.aspx");
        }

        protected void btnAddTime_Click(object sender, EventArgs e)
        {
            if (Panel4.Visible == true) Panel5.Visible = true;
            if (Panel3.Visible == true) Panel4.Visible = true;
            if (Panel2.Visible == true) Panel3.Visible = true;
            if (Panel1.Visible == true) Panel2.Visible = true; 
            Panel1.Visible = true;
        }
        
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("OldMedicine_List.aspx");
        }
        protected void ini()
        {
            tbNname.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
        }

        protected void btnSetTimeCancel1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            if (Panel2.Visible == true) btnSetTimeCancel1.Enabled = false;
        }

        protected void btnSetTimeCancel2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            if (Panel3.Visible == true) btnSetTimeCancel2.Enabled = false;
        }

        protected void btnSetTimeCancel3_Click(object sender, EventArgs e)
        {
            Panel3.Visible = false;
            if (Panel4.Visible == true) btnSetTimeCancel3.Enabled = false;
        }

        protected void btnSetTimeCancel4_Click(object sender, EventArgs e)
        {
            Panel4.Visible = false;
            if (Panel5.Visible == true) btnSetTimeCancel4.Enabled = false;
        }

        protected void btnSetTimeCancel5_Click(object sender, EventArgs e)
        {
            Panel5.Visible = false; 
        }
        
    }
}