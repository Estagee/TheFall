<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--
    <script type="text/javascript">
        jQuery(function ($) {
            $("#TextBoxData1").mask("99-99-9999", { placeholder: "mm-dd-yyyy" });
            $("#TextBoxData2").mask("99-99-9999", { placeholder: "mm-dd-yyyy" });
        });
    </script>
      -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <p style="font-size: 40px" class="customfont">
                SEARCH POSTS </>
            <br />
                <p style="font-size: 25px" class="customfont">
                    FROM&nbsp; 
                    <asp:TextBox ID="TextBoxData1" runat="server" TextMode="Date" ClientIDMode="Static" Width="143px" Style="text-align: center" Enabled="False"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="2%" ImageUrl="~/Pic/404-200.png" Width="2%" OnClick="ImageButton2_Click" />
                    &nbsp;TO 
            <asp:TextBox ID="TextBoxData2" runat="server" TextMode="Date" ClientIDMode="Static" Width="143px" Style="text-align: center" Enabled="False"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="2%" ImageUrl="~/Pic/404-200.png" Width="2%" Enabled="False" OnClick="ImageButton3_Click" />
                    <asp:Calendar Visible="false" Style="font-family: 'My Custom Font'; font-size: 22px; margin-left: auto; margin-right: auto;" ID="Calendar1" runat="server" Height="25px" Width="204px" BackColor="White" BorderColor="White" OnSelectionChanged="Calendar1_SelectionChanged1">
                        <TitleStyle BackColor="White" />
                    </asp:Calendar>
                    <asp:Calendar OnDayRender="Calendar2_DayRender" Visible="false" Style="font-family: 'My Custom Font'; font-size: 22px; margin-left: auto; margin-right: auto;" ID="Calendar2" runat="server" Height="25px" Width="204px" BackColor="White" BorderColor="White" OnSelectionChanged="Calendar2_SelectionChanged">
                        <TitleStyle BackColor="White" />
                    </asp:Calendar>
                    <br />
                    <!--
                    <asp:CompareValidator  ID="CompareValidator1" runat="server"
                         ErrorMessage="Second date should be greater than first date!" Display="Dynamic" 
                         ControlToValidate="TextBoxData1" Operator="DataTypeCheck" Type="Date" Font-Size="15pt" ForeColor="#CC0000" ControlToCompare="TextBoxData2"></asp:CompareValidator>  
                    -->
                </p>
                <br />
                <!--
                <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " ID="Button2" runat="server" Text="Search" OnClick="Button2_Click" />
                <br />
                  -->
                <asp:DataList ID="DataList1" runat="server" DataKeyField="id_posty" DataMember="DefaultView" DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="50%">
                    <ItemTemplate>
                        <p class="tralala" style="color: #222;">
                            <span class="glyphicon glyphicon-time"></span>
                            Posted on <%# Eval("p_data", "{0:dd/MM/yyyy}") %> at <%# Eval("p_data", "{0:HH:mm}") %>                                   
                  by
                        <h:link style="color: #f9c010;" class="lead" rel="#"> <%# Eval("u_nick") %></h:link>
                        </p>
                        <hr />
                        <hr style="width: 70%" />
                        <div class="adsda">
                            <asp:ImageButton CssClass="img-responsive" ID="ImageButton1" runat="server" ImageUrl='<%# Eval("p_link")   %>' AlternateText="U losed ur connection with internet or the data base is not turn on actually" />
                        </div>
                        <hr style="width: 70%" />
                        <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " ID="Button1" runat="server" Text="Read Comments" />
                        <hr />
                        <br />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=LENOVO\SQLEXPRESS;Initial Catalog=PatrykRedzinski;Integrated Security=True" SelectCommand="SELECT Posty.id_posty, Posty.p_link, Posty.p_data, Uzytkownik.u_nick FROM Posty INNER JOIN Uzytkownik ON Posty.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE (Posty.p_data BETWEEN convert(date, @p_dataod, 105)  AND convert(date, @p_datado, 105) )" ProviderName="System.Data.SqlClient">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxData1" Name="p_dataod" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxData2" Name="p_datado" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

