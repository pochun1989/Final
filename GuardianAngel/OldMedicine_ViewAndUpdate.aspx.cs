using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuardianAngel
{
    public partial class OldMedicine_ViewAndUpdate : System.Web.UI.Page

    {
        string uId = "";
        int nid;
        int oid;
        int count;
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            oid = Convert.ToInt32(Session["oId"]);
            nid = Convert.ToInt32(Session["nId"]);
            uid = Convert.ToInt32(Session["uId"]);

            search();
            if (uid == 0)
            {
                Server.Transfer("Login.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    dbLoad();
                    GridView1Style();
                    txtName.Enabled = false;
                    DropDownList1.Visible = false;
                    DropDownList2.Visible = false;
                    lblHour.Visible = false;
                    lblMinute.Visible = false;
                    btnSure.Enabled = false;
                }
            }
        }

        //load資料
        protected void dbLoad() 
        {
            SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True;");
            con.Open();
            btnDelete.Attributes["OnClick"] = "return confirm('再一次確認,你確定要刪除這些資料嗎?')";
            string strSQL = "select O_name,N_name,[N_startdate],[N_enddate]" +
                            " from [dbo].[Oldman_Data] a join [dbo].[Notice] b " +
                            " on a.O_id = b.O_id where b.N_id = " + nid;

            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read() == true)
            {
                txtName.Text = string.Format("{0}", reader["O_name"]);
                txtMedicineName.Text = string.Format("{0}", reader["N_name"]);
                txtStartDate.Text = string.Format("{0}", reader["N_startdate"]);
                txtEndDate.Text = string.Format("{0}", reader["N_enddate"]);
            }
            reader.Close();
            cmd.Cancel();
            con.Close();
        }

        //GridView樣式設定
        private void GridView1Style()
        {
            GridView1.Font.Bold = true;

            //GridView
            GridView1.BorderColor = Color.White;
            GridView1.BorderWidth = 1;
            GridView1.RowStyle.Font.Size = 13;
            GridView1.RowStyle.Font.Name = "微軟正黑體";
            GridView1.CellSpacing = 5;
            GridView2.BorderColor = Color.White;
            GridView2.BorderWidth = 1;
            GridView2.RowStyle.Font.Size = 13;
            GridView2.RowStyle.Font.Name = "微軟正黑體";
            GridView2.CellSpacing = 5;

            //標題列
            GridView1.HeaderStyle.ForeColor = Color.Black;
            GridView1.HeaderStyle.Height = 40;
            GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;
            GridView2.HeaderStyle.ForeColor = Color.Black;
            GridView2.HeaderStyle.Height = 40;
            GridView2.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView2.EmptyDataRowStyle.VerticalAlign = VerticalAlign.Middle;

            //隱藏編號標籤,刪除欄位
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                Label myID = (Label)GridView1.Rows[i].Cells[0].FindControl("Label1");
                myID.Visible = false;
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (myCheckBox.Checked == true) count++;
            }
            if (count > 0) btnDelete.Enabled = true;
            else btnDelete.Enabled = false;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string myMessage = null;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox myCheckBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                Label myID = (Label)GridView1.Rows[i].FindControl("Label1");
                if (myCheckBox.Checked == true)
                    myMessage = myMessage + myID.Text + "or[P_id]=";
            }
            //刪除最後幾個字元(刪除最後面的or[P_id]=)
            myMessage = myMessage.Substring(0, myMessage.Length - 9);
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True;";

            sds.DeleteCommand = "delete NPGrouping where [N_id]=" + nid + "and ([P_id]=" + myMessage + ")";
            sds.Delete();
            Response.Redirect(Request.Url.ToString());
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session["nId"] = nid;
            Response.Redirect("OldMedicine_AddPill.aspx");
        }
       
        protected void btnBack(object sender, EventArgs e)
        {
            Response.Redirect("OldMedicine_List.aspx");
        }

        protected void btnSure_Click(object sender, EventArgs e)
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True;";
            sds.UpdateCommand = "update [dbo].[Notice] set [N_name] = '" + txtMedicineName.Text + "' where [N_id] = " + nid + ";" +
                                "update[dbo].[Notice] set[N_startdate] = '" + txtStartDate.Text + "' where[N_id] = " + nid + ";" +
                                "update[dbo].[Notice] set[N_enddate] = '" + txtEndDate.Text + "' where[N_id] = " + nid;
            sds.Update();
            txtMedicineName.Enabled = false;
            txtStartDate.Enabled = false;
            txtEndDate.Enabled = false;
            btnEdit.Enabled = true;
        }

       
                
        //新增用藥時間
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "myInsert")
            {
                GridView2.DataSourceID = "";
            }
        }

        //新增用藥時間
        protected void SqlDataSource2_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView2.DataSourceID = "SqlDataSource2";
        }

        //新增用藥時間送出
        protected void btnSendTime_Click(object sender, EventArgs e)
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True;";
            String hourSet = DropDownList1.SelectedItem.ToString();
            String minuteSet = DropDownList2.SelectedItem.ToString();
            sds.InsertCommand = "insert [dbo].[Time] ([N_id],[T_hour],[T_minute]) values (" + nid + "," + hourSet + "," + minuteSet + ")";
            sds.Insert();
            DropDownList1.Visible = false;
            DropDownList2.Visible = false;
            lblHour.Visible = false;
            lblMinute.Visible = false;
            btnAddTime.Enabled = true;
            btnSendTime.Visible = false;
            lblHour.Visible = false;
            lblMinute.Visible = false;
            Response.Redirect("OldMedicine_ViewAndUpdate.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtMedicineName.Enabled = true;
            txtStartDate.Enabled = true;
            txtEndDate.Enabled = true;
            btnSure.Enabled = true;
            btnEdit.Enabled = false;
        }

        //新增用藥時間
        protected void btnAddTime_Click1(object sender, ImageClickEventArgs e)
        {
            GridView2.DataSourceID = null;
            DropDownList1.Visible = true;
            DropDownList2.Visible = true;
            btnAddTime.Enabled = false;
            btnSendTime.Visible = true;
            lblHour.Visible = true;
            lblMinute.Visible = true;
        }

        private void search()
        {
            uId = Session["Uid"].ToString();
            SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True;");
            SqlCommand cmd = null;
            string sql = "SELECT a.A_status FROM Accident as a INNER JOIN Oldman_Data as o ON a.O_id = o.O_id WHERE o.U_id =" + uId + "AND a.A_status = 1";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() == true)
            {
                lblBell.Visible = true;
            }
            else
            {
                lblBell.Visible = false;
            }
            reader.Close();
            conn.Close();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            uId = Session["Uid"].ToString();
            SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=Guardian_Angel;Integrated Security=True;");
            SqlCommand cmd = null;
            string sql = "SELECT a.A_status FROM Accident as a INNER JOIN Oldman_Data as o ON a.O_id = o.O_id WHERE o.U_id =" + uId + "AND a.A_status = 1";
            conn.Open();
            cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() == true)
            {
                lblBell.Visible = true;
            }
            else
            {
                lblBell.Visible = false;
            }
            reader.Close();
            conn.Close();
        }
    }
}