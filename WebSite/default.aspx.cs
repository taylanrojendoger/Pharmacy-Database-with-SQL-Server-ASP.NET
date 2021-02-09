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


namespace  PHARMADATA
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
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
            string sqlstr = "select * from Pharmacist where Ssn=" + TextBox1.Text;

            SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
            da.Fill(ds);

            string FirstName = ds.Tables[0].Rows[0]["FirstName"].ToString();
            string LastName = ds.Tables[0].Rows[0]["LastName"].ToString();
            string PhoneNumber = ds.Tables[0].Rows[0]["Ssn"].ToString();
            string password = ds.Tables[0].Rows[0]["Password"].ToString();
            string enteredpasswd = TextBox2.Text;
            Console.WriteLine(password);
            con.Close();

            Session["FirstName"] = FirstName;
            Session["LastName"] = FirstName;
            Session["Ssn"] = PhoneNumber;

            if (String.Equals(password, enteredpasswd))
                Response.Redirect("Medicine.aspx");
            else
            {
                Label1.Text = "Invalid Password!";
                Response.AddHeader("REFRESH", "2;URL=default.aspx");
            }

           
        }
    }
}