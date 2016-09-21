<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table style="margin-left: auto; text-align: center; margin-left: auto; margin-right: auto; position: center; width: 63%;" class="nav-justified">
                <tr>
                    <td>
                        <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px; position: center; margin-left: auto; margin-right: auto;" CssClass="btn btn-primary " CausesValidation="false" ID="ButtonAccount" runat="server" Text="Account" OnClick="ButtonAccount_Click" />
                    </td>
                    <td>
                        <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px; position: center; margin-left: auto; margin-right: auto;" CssClass="btn btn-primary " CausesValidation="false" ID="ButtonYourPost" runat="server" Text="Your Post" OnClick="ButtonYourPost_Click" />
                    </td>
                    <td>
                        <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px; position: center; margin-left: auto; margin-right: auto;" CssClass="btn btn-primary " CausesValidation="false" ID="ButtonYourComments" runat="server" Text="Your Comments" OnClick="ButtonYourComments_Click" />
                    </td>
                    <td>
                        <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px; position: center; margin-left: auto; margin-right: auto;" CssClass=" btn btn-primary " Visible="false" CausesValidation="false" ID="ButtonAdmin" runat="server" Text="Admin" OnClick="ButtonAdmin_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Panel Style="text-align: center; margin-left: auto; margin-right: auto; position: center;" ID="PanelAccount" Visible="true" runat="server">
                <br />
                <p style="font-size: 40px" class="customfont">Account</p>
                <br />
                <table style="width: 24%; margin-left: 452px; text-align: center; margin-left: auto; margin-right: auto; position: center;" class="nav-justified" runat="server">
                    <tr>
                        <td style="width: 96px; height: 35px;">
                            <p class="tralala" style="color: black">
                                Nick: 
                            </p>
                        </td>
                        <td style="height: 35px">
                            <asp:Label ID="LabelNick" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 96px">
                            <p class="tralala" style="color: black;">
                                E-mail:
                            </p>
                        </td>
                        <td>
                            <asp:Label Style="text-align: center" ID="LabelEmail" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="margin-left: auto; text-align: center; margin-left: auto; margin-right: auto; position: center; width: 32%;" class="nav-justified">
                    <tr>
                        <td style="width: 112px">
                            <asp:Button Style="font-family: 'My Custom Font'; font-size: 20px; position: center" CssClass="btn btn-primary " CausesValidation="false" ID="ButtonChangePassword" runat="server" Text="Change password" Width="203px" OnClick="ButtonChangePassword_Click" />
                        </td>
                        <td>
                            <asp:Button Style="font-family: 'My Custom Font'; font-size: 20px; position: center" CssClass="btn btn-primary " CausesValidation="false" ID="ButtonChangeEmail" runat="server" Text="Change e-mail" Width="203px" OnClick="ButtonChangeEmail_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Label Visible="false" ID="LabelChangePassword" runat="server" Text="Password has changed" ForeColor="#CC0000"></asp:Label>
                <br />
                <asp:Label Visible="false" ID="LabelChangeEmail" runat="server" Text="E-mail has changed" ForeColor="#CC0000"></asp:Label>
                <asp:Panel Visible="false" ID="PanelChangePassword" runat="server">
                    <table style="width: 24%; margin-left: 452px; text-align: center; margin-left: auto; margin-right: auto; position: center;" class="nav-justified">
                        <tr>
                            <td style="width: 281px">New Password:</td>
                            <td>
                                <asp:TextBox ID="TextBoxNewPassword" runat="server" Width="171px" MaxLength="15" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cannot be empty" Display="Dynamic" ForeColor="#CC0000" ControlToValidate="TextBoxNewPassword"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 281px">Re-Password:</td>
                            <td>
                                <asp:TextBox ID="TextBoxNewRePassword" runat="server" Width="171px" Height="22px" MaxLength="15" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Cannot be empty" ControlToValidate="TextBoxNewRePassword" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <table style="width: 24%; margin-left: 452px; text-align: center; margin-left: auto; margin-right: auto; position: center;" class="nav-justified">
                        <tr>
                            <td style="width: 281px;">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="The values must be the same" Display="Dynamic" ControlToCompare="TextBoxNewRePassword" ControlToValidate="TextBoxNewPassword" ForeColor="#CC0000"></asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table style="margin-left: auto; text-align: center; margin-left: auto; margin-right: auto; position: center; width: 30%;" class="nav-justified">
                        <tr>
                            <td style="width: 239px">
                                <asp:Button Style="font-family: 'My Custom Font'; font-size: 15px; margin-left: auto; text-align: center; margin-left: auto; margin-right: auto; position: center;" CssClass="btnus btn-primary " ID="ButtonSavePassword" runat="server" Text="Save" OnClick="ButtonSavePassword_Click" />
                            </td>
                            <td style="width: 238px">
                                <asp:Button Style="font-family: 'My Custom Font'; font-size: 15px; margin-left: auto; text-align: center; margin-left: auto; margin-right: auto; position: center;" CssClass="btnus btn-primary " CausesValidation="false" ID="ButtonCancelPassword" runat="server" Text="Cancel" OnClick="ButtonCancelPassword_Click" Width="73px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel Visible="false" ID="PanelChangeemail" runat="server">
                    <table style="width: 27%; margin-left: auto; margin-right: auto; text-align: center" class="nav-justified">
                        <tr>
                            <td style="width: 134px">New E-mail:</td>
                            <td>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wrog e-mail" ControlToValidate="TextBoxNewEmail" Display="Dynamic" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:TextBox ID="TextBoxNewEmail" runat="server" Width="210px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Cannot be empty" ControlToValidate="TextBoxNewEmail" Display="Dynamic" ForeColor="#CC0000"></asp:RequiredFieldValidator>

                                <br />
                                <asp:Label Visible="false" ID="LabelEmailBusy" runat="server" ForeColor="#CC0000" Text="This e-mail is busy"></asp:Label>

                            </td>
                        </tr>
                    </table>
                    <br />
                    <table style="margin-left: auto; text-align: center; margin-left: auto; margin-right: auto; position: center; width: 30%;" class="nav-justified">
                        <tr>
                            <td style="width: 239px">
                                <asp:Button Style="font-family: 'My Custom Font'; font-size: 15px" CssClass="btnus btn-primary " ID="ButtonSaveEmail" runat="server" Text="Save" OnClick="ButtonSaveEmail_Click" />
                            </td>
                            <td style="width: 238px">
                                <asp:Button Style="font-family: 'My Custom Font'; font-size: 15px" CssClass="btnus btn-primary " CausesValidation="false" ID="ButtonCancelEmail" runat="server" Text="Cancel" Width="78px" OnClick="ButtonCancelEmail_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel Style="text-align: center; margin-left: auto; margin-right: auto; position: center;" Visible="false" ID="PanelPosts" runat="server">
                <br />
                <p style="font-size: 40px" class="customfont">Your Posts</p>
                <br />
                <asp:DataList ID="DaneZBazyDataList" runat="server" DataMember="DefaultView" DataSourceID="SqlDataSource3" HorizontalAlign="Center" Width="50%" OnDeleteCommand="DaneZBazyDataList_DeleteCommand" OnItemCommand="DaneZBazyDataList_ItemCommand">
                    <ItemTemplate>
                        <p class="tralala" style="color: #222;">
                            <span class="glyphicon glyphicon-time"></span>
                            Posted on <%# Eval("p_data", "{0:dd/MM/yyyy}") %> at <%# Eval("p_data", "{0:HH:mm}") %>                                   
                  by
                        <h:link style="color: #f9c010;" class="lead" rel="#">
    <%# Eval("u_nick") %>
    </h:link>
                        </p>
                        <hr />
                        <hr style="width: 70%" />
                        <div class="adsda">
                            <asp:Label Visible="false" ID="LabelofSelectedItem" runat="server" Text='<%# Eval("id_posty")%>'></asp:Label>
                            <asp:ImageButton CssClass="img-responsive" ID="ImageButton1" runat="server" ImageUrl='<%# Eval("p_link")   %>' AlternateText="U losed ur connection with internet or the data base is not turn on actually" Enabled="False" />
                        </div>
                        <hr style="width: 70%" />
                        <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " ID="ButtonDelete" runat="server" Text="Delete" CommandName="Delete" />
                        <br />
                        <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " ID="Button1" runat="server" Text="Show Comments" CommandName="ShowComments" />
                        <hr />
                        <br />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>


            </asp:Panel>
            <asp:Panel ID="PanelComments" Visible="false" runat="server">
                <br />
                <p style="font-size: 40px" class="customfont">Your comments</p>
                <br />
                <asp:DataList ID="DataList1" runat="server" DataMember="DefaultView" DataSourceID="SqlDataSource4" HorizontalAlign="Center" Width="50%" DataKeyField="id_posty" OnEditCommand="DataListCommentsofPost_EditCommand" OnUpdateCommand="DataListCommentsofPost_UpdateCommand" OnCancelCommand="DataListCommentsofPost_CancelCommand" OnDeleteCommand="DataListCommentsofPost_DeleteCommand" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>

                        <asp:Label ID="LabelIdKomentarze" Visible="false" runat="server" Text='<%# Eval("id_komentarze") %>'></asp:Label>
                        <asp:Label ID="LabelIdPosty" Visible="false" runat="server" Text='<%# Eval("id_posty") %>'></asp:Label>
                        <br />
                        <p class="tralala" style="color: #222;">
                            <asp:ImageButton CommandName="przejdzdo" Style="width: 15%; height: 15%; margin: 6px" ID="ImageButton3" runat="server" ImageUrl='<%# Eval("p_link")   %>' AlternateText="U losed ur connection with internet or the data base is not turn on actually" />
                            <span class="glyphicon glyphicon-time"></span>
                            Comment on <%# Eval("k_data", "{0:dd/MM/yyyy}") %> at <%# Eval("k_data", "{0:HH:mm}") %>                                   
                  by
                        <h:link style="color: #f9c010;" class="lead" rel="#">
                <%# Eval("u_nick") %>
                </h:link>
                        </p>
                        <asp:TextBox Text='<%# Eval("k_note") %>' Enabled="false" Style="margin-left: auto; margin-right: auto; position: center" ID="TextBox1" runat="server" TextMode="MultiLine" Rows="5" Width="647px"> </asp:TextBox>

                        <asp:TextBox Text='<%# Eval("k_note") %>' Enabled="true" Visible="false" Style="margin-left: auto; margin-right: auto; position: center" ID="TextBox2" runat="server" TextMode="MultiLine" Rows="5" Width="647px" MaxLength="500"> </asp:TextBox>
                        <asp:Panel Visible='<%#Eval("u_nick").Equals(Session["LogedNick"]) %>' ID="Panel2" runat="server">
                            <asp:Button ID="ButtonEdit" Style="font-family: 'My Custom Font'; float: left; font-size: 15px" CssClass="btnus btn-primary " runat="server" Text="Edit" CommandName="Edit" />
                            <asp:Button ID="ButtonDelete" Style="font-family: 'My Custom Font'; float: left; font-size: 15px" CssClass="btnus btn-primary " runat="server" Text="Delete" CommandName="Delete" />
                            <asp:Button Visible="false" Style="font-family: 'My Custom Font'; float: left; font-size: 15px" CssClass="btnus btn-primary " ID="ButtonSave" runat="server" Text="Update" CommandName="Update" />
                            <asp:Button CausesValidation="False" Visible="false" Style="font-family: 'My Custom Font'; float: left; font-size: 15px" CssClass="btnus btn-primary " ID="ButtonCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Comments  cannot be the same" ControlToCompare="TextBox1" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="#CC0000" Operator="NotEqual"></asp:CompareValidator>

                        </asp:Panel>


                    </ItemTemplate>
                </asp:DataList>

            </asp:Panel>
            <asp:Panel Style="text-align: center; margin-left: auto; margin-right: auto; position: center;" ID="PanelAdmin" Visible="false" runat="server">
                <br />
                <p style="font-size: 40px" class="customfont">Users</p>
                <br />
                <asp:GridView Style="text-align: center; margin-left: auto; margin-right: auto; position: center;" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource6" ForeColor="Black" GridLines="Horizontal" PageSize="5" Width="750px" DataKeyNames="id_uzytkownik">
                    <Columns>
                        <asp:BoundField DataField="id_uzytkownik" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id_uzytkownik" />
                        <asp:BoundField DataField="u_nick" HeaderText="Nick" SortExpression="u_nick" />
                        <asp:BoundField DataField="u_password" HeaderText="Password" SortExpression="u_password" />
                        <asp:BoundField DataField="u_e_mail" HeaderText="E-mail" SortExpression="u_e_mail" />
                        <asp:BoundField DataField="u_admin" HeaderText="Admin?" SortExpression="u_admin" />
                        <asp:BoundField DataField="u_blokada" HeaderText="Ban?" SortExpression="u_blokada" />
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" HeaderText="Delete" />
                        <asp:CommandField ShowEditButton="True" ButtonType="Button" HeaderText="Edit/Update" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <br />
                <p style="font-size: 40px" class="customfont">Posts</p>
                <br />
                <asp:GridView ID="GridView2" runat="server" Style="text-align: center; margin-left: auto; margin-right: auto; position: center;" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource7" ForeColor="Black" GridLines="Horizontal" Width="715px" AllowPaging="True" AllowSorting="True" PageSize="5" DataKeyNames="id_posty" OnRowDeleting="GridView2_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="id_posty">
                            <ItemTemplate>
                                <asp:Label ID="LabelIdPosty" runat="server" Text='<%# Bind("id_posty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Link" SortExpression="p_link">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%#   Bind("p_link") %>' MaxLength="200"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton Style="width: 15%; height: 15%; margin: 6px" ID="ImageButton3" runat="server" ImageUrl='<%# Eval("p_link")   %>' AlternateText="U losed ur connection with internet or the data base is not turn on actually" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="p_data" HeaderText="Data" SortExpression="p_data" />

                        <asp:TemplateField HeaderText="Nick" SortExpression="u_nick">

                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("u_nick") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="p_usun" HeaderText="Delete?" SortExpression="p_usun" />
                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField HeaderText="Edit/Update" ShowEditButton="True" ButtonType="Button" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <br />
                <p style="font-size: 40px" class="customfont">Comments</p>
                <br />
                <asp:GridView DataKeyNames="id_komentarze" ID="GridView3" runat="server" Style="text-align: center; margin-left: auto; margin-right: auto; position: center;" DataSourceID="SqlDataSource8" AutoGenerateColumns="False" Width="1111px" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4"  ForeColor="Black" GridLines="Horizontal" PageSize="5">
                    <Columns>
                        <asp:BoundField DataField="id_komentarze" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id_komentarze" />
                        <asp:BoundField DataField="k_note" HeaderText="Note" SortExpression="k_note" />
                        <asp:BoundField DataField="k_data" HeaderText="Date" SortExpression="k_data" />
                        <asp:BoundField DataField="u_nick" HeaderText="Nick" SortExpression="u_nick" />
                        <asp:TemplateField HeaderText="From Post" SortExpression="p_link">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("p_link") %>' MaxLength="200"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:ImageButton Style="width: 15%; height: 15%; margin: 6px" ID="ImageButton3" runat="server" ImageUrl='<%# Eval("p_link")   %>' AlternateText="U losed ur connection with internet or the data base is not turn on actually" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="k_usun" HeaderText="Delete?" SortExpression="k_usun" />
                        <asp:CommandField HeaderText="Edit/Update" ShowEditButton="True" />
                        <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>


            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT u_nick, u_admin, u_e_mail FROM Uzytkownik WHERE (u_nick = @u_nick)">
        <SelectParameters>
            <asp:SessionParameter Name="u_nick" SessionField="LogedNick" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBoxNewPassword" Name="u_password" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxNewEmail" Name="u_e_mail" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT u_e_mail FROM Uzytkownik WHERE u_e_mail =@u_e_mail">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxNewEmail" Name="u_e_mail" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT Posty.id_posty, Posty.p_link, Posty.p_data, Uzytkownik.u_nick FROM Posty INNER JOIN Uzytkownik ON Posty.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE Uzytkownik.u_nick = @u_nick AND p_usun=0 ORDER BY Posty.id_posty DESC ">
        <SelectParameters>
            <asp:SessionParameter Name="u_nick" SessionField="LogedNick" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT Komentarze.id_komentarze, Komentarze.k_note, Komentarze.k_data, Posty.p_link, Uzytkownik.u_nick, Posty.id_posty FROM Komentarze INNER JOIN Posty ON Komentarze.Posty_id_posty = Posty.id_posty INNER JOIN Uzytkownik ON Komentarze.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE (Uzytkownik.u_nick = @u_nick) AND (Posty.p_usun = 0) AND (Komentarze.k_usun = 0)">
        <SelectParameters>
            <asp:SessionParameter Name="u_nick" SessionField="LogedNick" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT Komentarze.k_note, Komentarze.id_komentarze, Komentarze.k_data, Posty.p_link, Uzytkownik.u_nick, Komentarze.Posty_id_posty FROM Komentarze INNER JOIN Posty ON Komentarze.Posty_id_posty = Posty.id_posty INNER JOIN Uzytkownik ON Komentarze.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE (Komentarze.k_usun = 0) AND (Komentarze.Posty_id_posty = @id_posty)">
        <SelectParameters>
            <asp:SessionParameter Name="id_posty" SessionField="ChoosedPost1" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT Uzytkownik.* FROM Uzytkownik" UpdateCommand="UPDATE Uzytkownik SET u_nick = @u_nick, u_password = @u_password, u_admin = @u_admin, u_e_mail = @u_e_mail, u_blokada = @u_blokada WHERE (id_uzytkownik = @id_uzytkownik)" DeleteCommand="DELETE FROM Uzytkownik WHERE (Uzytkownik.id_uzytkownik = @id_uzytkownik)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id_uzytkownik" PropertyName="SelectedValue" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GridView1" Name="u_nick" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="u_password" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="u_admin" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="u_e_mail" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="u_blokada" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="id_uzytkownik" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT Posty.id_posty, Posty.p_link, Posty.p_data, Posty.p_usun, Uzytkownik.u_nick FROM Posty INNER JOIN Uzytkownik ON Posty.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik" DeleteCommand="DELETE FROM Komentarze WHERE Posty_id_posty=@id_posty;
DELETE FROM Posty WHERE id_posty=@id_posty;"
        UpdateCommand="UPDATE Posty SET p_link = @p_link, p_usun = @p_usun, p_data = @p_data WHERE (id_posty = @id_posty)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView2" Name="id_posty" PropertyName="SelectedValue" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GridView2" Name="p_link" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView2" Name="id_posty" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView2" Name="p_usun" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView2" DbType="DateTime" Name="p_data" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT Komentarze.k_note, Komentarze.k_data, Komentarze.k_usun, Posty.p_link, Uzytkownik.u_nick, Komentarze.id_komentarze FROM Komentarze INNER JOIN Posty ON Komentarze.Posty_id_posty = Posty.id_posty INNER JOIN Uzytkownik ON Komentarze.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik" DeleteCommand="DELETE FROM Komentarze WHERE (id_komentarze = @id_komentarze)" UpdateCommand="UPDATE Komentarze SET k_note =@k_note, k_data =@k_data, k_usun =@k_usun WHERE id_komentarze=@id_komentarze">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView3" Name="id_komentarze" PropertyName="SelectedValue" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GridView3" Name="k_usun" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView3" Name="k_note" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView3" DbType="DateTime" Name="k_data" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView3" Name="id_komentarze" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

