<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="signlog.aspx.cs" Inherits="signlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel  style="margin-left:auto; margin-right:auto; position:center; text-align:center;" ID="Panel1" runat="server" Visible="true">
                <p style="font-size: 40px" class="customfont">Log In</p>
                &nbsp;<table style="height: 105px; margin-left: auto; margin-right: auto; position: center; width: 436px;">
                    <tr>
                        <td style="text-align: left; width: 14%;">
                            <asp:Label Style="color: #222; font-size: 18px; font-family: 'My Custom Font2';" ID="Label10" runat="server" Text="Nick: "></asp:Label>
                            <br />
                            <asp:Label Style="color: #222; font-size: 18px; font-family: 'My Custom Font2';" ID="Label11" runat="server" Text="Password: "></asp:Label>
                        </td>
                        <td style="text-align: left; width: 43%;">
                            <asp:TextBox ID="TextBoxLogNick" runat="server" Width="171px" MaxLength="15"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxLogNick" Display="Dynamic" ErrorMessage="Enter your nick" ForeColor="#CC0000"></asp:RequiredFieldValidator>

                            <br />
                            <asp:TextBox ID="TextBoxLogPassword" runat="server" Width="170px" TextMode="Password" MaxLength="16"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxLogPassword" Display="Dynamic" ErrorMessage="Enter your password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>

                <asp:Label Visible="False" ID="LabelBan" runat="server" ForeColor="#CC0000"></asp:Label>

                <br />

                <br />
                <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " ID="Button3" runat="server" Text="Log In" OnClick="Button3_Click" />
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="false">
                <p style="font-size: 40px" class="customfont">Sign In</p>
                <table style="width: 66%; height: 118px; text-align: left; margin-left: auto; margin-right: auto;">
                    <tr>
                        <td style="width: 121px">
                            <asp:Label Style="color: #222; font-size: 18px; font-family: 'My Custom Font2';" ID="Label3" runat="server" Text="Nick: "></asp:Label>
                            <br />
                            <asp:Label Style="color: #222; font-size: 18px; font-family: 'My Custom Font2';" ID="Label4" runat="server" Text="Password: "></asp:Label>
                            <br />
                            <asp:Label Style="color: #222; font-size: 18px; font-family: 'My Custom Font2';" ID="Label5" runat="server" Text="Re-Password: "></asp:Label>
                            <br />
                            <asp:Label Style="color: #222; font-size: 18px; font-family: 'My Custom Font2';" ID="Label6" runat="server" Text="Email: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxSignNick" runat="server" Width="201px" MaxLength="15"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxSignNick" Display="Dynamic" ErrorMessage="Enter your nick" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxSignNick" Display="Dynamic" ErrorMessage="Min 3 signs, Max 15 signs consist of numbers and letters" ForeColor="#CC0000" ValidationExpression="[A-Za-z0-9]{3,15}"></asp:RegularExpressionValidator>
                            &nbsp;<asp:Label ID="Label13" runat="server" ForeColor="#CC0000"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBoxSignPassword" runat="server" Width="201px" MaxLength="16" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxSignPassword" Display="Dynamic" ErrorMessage="Enter your password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxSignPassword" Display="Dynamic" ErrorMessage="Min 8 signs, Max 16 signs consist of numbers and letters" ForeColor="#CC0000" ValidationExpression="[A-Za-z0-9]{8,16}"></asp:RegularExpressionValidator>
                            <br />
                            <asp:TextBox ID="TextBoxSignRePass" runat="server" Width="201px" MaxLength="16" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxSignRePass" Display="Dynamic" ErrorMessage="Enter your re-password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxSignPassword" ControlToValidate="TextBoxSignRePass" ErrorMessage="Passwords are not the same" ForeColor="#CC0000" Display="Dynamic"></asp:CompareValidator>
                            <br />
                            <asp:TextBox ID="TextBoxSignEmail" runat="server" Width="201px" MaxLength="100" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxSignEmail" Display="Dynamic" ErrorMessage="Enter your e-mail" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBoxSignEmail" Display="Dynamic" ErrorMessage="Wrong e-mail" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            &nbsp;<asp:Label ID="Label12" runat="server" ForeColor="#CC0000"></asp:Label>
                        </td>
                    </tr>

                </table>

                <br />
                <br />
                <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " ID="Button2" runat="server" Text="Sign In" OnClick="Button2_Click" />
                <br />
                <asp:Label Visible="false" ID="Label1" runat="server" Text="Label"><p style="font-size: 25px" class="customfont">You are registered now, you can log in. Wait for moving you to main page or click there<a style="font-size: 25px; margin-right:auto;margin-left:auto; position:center" class="customfont" href="index.aspx" > Main Page</a>. </p> </asp:Label>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <br />
    <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" CausesValidation="false" />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=LENOVO\SQLEXPRESS;Initial Catalog=PatrykRedzinski;Integrated Security=True" SelectCommand="SELECT u_password, u_nick, u_blokada FROM Uzytkownik WHERE (u_nick = @u_nick) AND (u_password = @u_password)" ProviderName="System.Data.SqlClient">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxLogNick" DefaultValue="" Name="u_nick" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxLogPassword" Name="u_password" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=LENOVO\SQLEXPRESS;Initial Catalog=PatrykRedzinski;Integrated Security=True" SelectCommand="SELECT u_e_mail, u_nick FROM Uzytkownik WHERE (u_e_mail= @u_e_mail) OR (u_nick = @u_nick)" InsertCommand="INSERT INTO Uzytkownik(u_nick, u_password, u_e_mail) VALUES (@u_nick,@u_password,@u_e_mail)" ProviderName="System.Data.SqlClient">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBoxSignNick" Name="u_nick" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxSignPassword" Name="u_password" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxSignEmail" Name="u_e_mail" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxSignEmail" Name="u_e_mail" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxSignNick" Name="u_nick" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

