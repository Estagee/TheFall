<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Addpost.aspx.cs" Inherits="Addpost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" Width="50%" style=" position:center; margin-left:auto; margin-right:auto">
                <br />
                <p style="font-size: 40px" class="customfont">Add new fall</p>
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td style="text-align: center">
                            <br />
                            <asp:RegularExpressionValidator Style="margin-left: auto; margin-right: auto; position: center" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wrong extension. Try with png, jpg, jpeg or gif extension. For example:   http://www.something.com/something1/image.jpg" Display="Dynamic" ControlToValidate="TextBoxLink" ForeColor="#CC0000" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?\.(gif|jpg|jpeg|tiff|png)$" Width="351px" CssClass="center-block"></asp:RegularExpressionValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBoxLink" runat="server"
                                TextMode="Url" Columns="100" MaxLength="200" AutoCompleteType="BusinessUrl" Rows="2" Wrap="True" CssClass="center-block" Width="746px"></asp:TextBox>
                            <br />
                        </td>
                    </tr>
                </table>
                <asp:Button ID="Button1" Style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " runat="server" Text="Check" OnClick="Button1_Click" />
                <br />
                                <asp:Label Visible="false" ID="Label1" runat="server" Text="Label"><p style="font-size: 25px" class="customfont">You added new post. You can back to  <a style="font-size: 25px; margin-right:auto;margin-left:auto; position:center" class="customfont" href="index.aspx" > Main Page</a>. </p> </asp:Label>

                <hr />

                <hr style="width: 70%" />
                <div class="adsda">
                    <asp:ImageButton   Visible="false" Enabled="false" CssClass="img-responsive" ID="ImageButton1" runat="server" AlternateText="U losed ur connection with internet or the data base is not turn on actually"  />
                </div>
                <hr style="width: 70%" />
                <br />
                <hr />
   
                <asp:Button Visible="false" ID="Button2" Style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " runat="server" Text="Add" OnClick="Button2_Click" />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT [id_posty] FROM [Posty] WHERE " InsertCommand="INSERT INTO Posty(p_link, Uzytkownik_id_uzytkownik) VALUES ('dasdsadsadsadsa',SELECT )" ProviderName="<%$ ConnectionStrings:PatrykRedzinskiConnectionString.ProviderName %>"></asp:SqlDataSource>

</asp:Content>

