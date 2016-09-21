<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p class="customfont">The Fall</p>
    <!-- Blog Entries Column -->
    <asp:Datalist id="DaneZBazyDataList" runat="server" datakeyfield="id_posty" datamember="DefaultView" datasourceid="SqlDataSource1" horizontalalign="Center" cellspacing="0" OnItemCommand="DaneZBazyDataList_ItemCommand" Width="50%">
        <ItemTemplate>      
                <p class="tralala" style="color: #222;">
                    <span class="glyphicon glyphicon-time"></span>
                    Posted on <%# Eval("p_data", "{0:dd/MM/yyyy}") %> at <%# Eval("p_data", "{0:HH:mm}") %>                                   
                  by <h:link style="color: #f9c010;" class="lead" rel="#">
    <%# Eval("u_nick") %>
    </h:link>
                </p>
                <hr />
                <hr style="width: 70%" />
                <div class="adsda">
                    <asp:Label Visible="false" ID="LabelofSelectedItem" runat="server" Text='<%# Eval("id_posty")%>'></asp:Label>   
                <asp:ImageButton  CssClass="img-responsive" ID="ImageButton1" runat="server" ImageUrl='<%# Eval("p_link")   %>' AlternateText="U losed ur connection with internet or the data base is not turn on actually" Enabled="False"  />
                </div>
                <hr style="width: 70%" />
                <asp:Button  style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " ID="Button1" runat="server" Text="Read Comments"  />
                <hr />
                <br />
                <br />
                <br />           
        </ItemTemplate>
    </asp:Datalist>
    <asp:sqldatasource id="SqlDataSource1" runat="server"
        connectionstring="Data Source=LENOVO\SQLEXPRESS;Initial Catalog=PatrykRedzinski;Integrated Security=True"
        selectcommand="SELECT Posty.id_posty, Posty.p_link, Posty.p_data, Uzytkownik.u_nick FROM Posty INNER JOIN Uzytkownik ON Posty.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE p_usun=0 ORDER BY Posty.id_posty DESC " providername="System.Data.SqlClient"></asp:sqldatasource>
</asp:Content>


