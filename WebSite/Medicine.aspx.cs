using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// 
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace PHARMADATA
{
    public partial class Medicine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = " Welcome " + Session["FirstName"];

        }

       

        protected void Button1_Click(object sender, EventArgs e)
        {

            string cmd = "exec sp_ShelfPlace " + TextBox1.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter(cmd, con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            try
            {
                con.Open();
            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }


            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();



        }


        protected void Button2_Click(object sender, EventArgs e)
        {

            string cmd = "exec sp_PatientMedicine " + TextBox2.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter(cmd, con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            try
            {
                con.Open();
            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }


            GridView2.DataSource = ds;
            GridView2.DataBind();
            con.Close();



        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            string cmd = "exec sp_PatientInfo " + TextBox3.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter(cmd, con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            try
            {
                con.Open();
            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }


            GridView3.DataSource = ds;
            GridView3.DataBind();
            con.Close();

        }

        protected void Button4_Click(object sender, EventArgs e)
        {

            string cmd = "exec sp_InsuranceStuation " + TextBox4.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter(cmd, con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            try
            {
                con.Open();
            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }


            GridView4.DataSource = ds;
            GridView4.DataBind();
            con.Close();

        }
        protected void Button5_Click(object sender, EventArgs e)
        {

            string cmd = "exec sp_StockSituation " + TextBox5.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter(cmd, con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            try
            {
                con.Open();
            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }


            GridView5.DataSource = ds;
            GridView5.DataBind();
            con.Close();

        }
        protected void Button6_Click(object sender, EventArgs e)
        {

            string cmd = "exec sp_OtherProductInfo " + TextBox6.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter(cmd, con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            try
            {
                con.Open();
            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }


            GridView6.DataSource = ds;
            GridView6.DataBind();
            con.Close();

        }

        protected void Button7_Click(object sender, EventArgs e)
        {

            string cmd = "exec sp_Profits " + TextBox7.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter(cmd, con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            try
            {
                con.Open();
            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }


            GridView7.DataSource = ds;
            GridView7.DataBind();
            con.Close();

        }

        protected void Button8_Click(object sender, EventArgs e)
        {

            string cmd = "exec sp_MedicineWarehouse " + TextBox8.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter(cmd, con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            try
            {
                con.Open();
            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }


            GridView8.DataSource = ds;
            GridView8.DataBind();
            con.Close();

        }

        protected void Button9_Click(object sender, EventArgs e)
        {

            string cmd = "exec sp_TotalPrice " + TextBox9.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            SqlDataAdapter da = new SqlDataAdapter(cmd, con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            try
            {
                con.Open();
            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }


            GridView9.DataSource = ds;
            GridView9.DataBind();
            con.Close();

        }

        protected void Button10_Click(object sender, EventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            try
            {
                con.Open();

            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }

            DataSet ds = new DataSet();
            string sqlstr = "select *  From Pharmacist p";

            SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
            da.Fill(ds);

            GridView10.DataSource = ds;
            GridView10.DataBind();
            con.Close();

        }


        protected void Button11_Click(object sender, EventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            try
            {
                con.Open();

            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }

            DataSet ds = new DataSet();
            string sqlstr = "select * From Medicine m";

            SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
            da.Fill(ds);

            GridView11.DataSource = ds;
            GridView11.DataBind();
            con.Close();


        }

        protected void Button12_Click(object sender, EventArgs e)
        {


            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();
            SqlConnection con = new SqlConnection(connectionString);

            try
            {
                con.Open();

            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }

            DataSet ds = new DataSet();
            string sqlstr = "select * From Patient p";

            SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
            da.Fill(ds);

            GridView12.DataSource = ds;
            GridView12.DataBind();
            con.Close();


        }






    }
}

/*	Select Name, Category, ShelfPlace
	From Medicine
	Where Category = @Category*/

/**


            cmd.Parameters.Add("@Ssn", SqlDbType.NVarChar).Value = TextBox1.Text;
            cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = TextBox2.Text;
            cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = TextBox3.Text;
            cmd.Parameters.Add("@PhoneNumber", SqlDbType.VarChar).Value = TextBox4.Text;
            cmd.Parameters.Add("@InsuranceStuation", SqlDbType.VarChar).Value = TextBox5.Text;
            cmd.Parameters.Add("@PrescriptionNumber", SqlDbType.NVarChar).Value = TextBox6.Text;
            cmd.Parameters.Add("@ProductName", SqlDbType.NVarChar).Value = TextBox7.Text;
            cmd.Parameters.Add("@Birthdate", SqlDbType.NVarChar).Value = TextBox8.Text;
            cmd.Parameters.Add("@PatientZipCode", SqlDbType.NVarChar).Value = TextBox9.Text;
            // cmd.Parameters.Add("@Age", SqlDbType.VarChar).Value = TextBox3.Text;
            cmd.Parameters.Add("@HasDebt", SqlDbType.NVarChar).Value = TextBox10.Text;*/