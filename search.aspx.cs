using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }




    protected void Calendar1_SelectionChanged1(object sender, EventArgs e)
    {

        TextBoxData1.Text = Calendar1.SelectedDate.ToString("dd / MM / yyyy");
        Calendar1.Visible = false;
        ImageButton3.Enabled = true;


    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true; 
        ImageButton2.Enabled = false; 
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Calendar2.Visible = true;
    }

    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        TextBoxData2.Text = Calendar2.SelectedDate.ToString("dd / MM / yyyy");
        Calendar2.Visible = false;
        ImageButton2.Enabled = true;
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
    {
        DateTime dte = Calendar1.SelectedDate;
        if (e.Day.Date <= dte)
        {
            e.Day.IsSelectable = false;
            e.Cell.ForeColor = System.Drawing.Color.Gray;
        }
    }
}