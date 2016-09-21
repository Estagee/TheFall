<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:DataList ID="JedenPostAndKomentarze" runat="server" DataKeyField="id_posty" DataMember="DefaultView" DataSourceID="SqlDataSource1" HorizontalAlign="Center" CellSpacing="0" Width="50%">
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
                    <hr />
                    <br />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:Panel Visible="false" ID="Panel1" Width="50%" runat="server" HorizontalAlign="Center" Style="margin-left: auto; margin-right: auto; position: center">
                <p style="font-size: 40px" class="customfont">Add Comment</p>
                <asp:TextBox ID="TextBoxAddComment" runat="server" Style="text-align: left" TextMode="MultiLine" Rows="5" Width="647px" MaxLength="500"></asp:TextBox>
                <br />
                <asp:Button Style="font-family: 'My Custom Font'; font-size: 22px" CssClass="btn btn-primary " ID="Button1" runat="server" Text="Add Comment" OnClick="Button1_Click" />
                <asp:Label ID="Label2" Visible="false" ForeColor="#CC0000" runat="server" Text="Label"> Put some text to add comment!</asp:Label>
                <asp:Label Visible="false" ID="LabelCommentAdded" runat="server" Text="Label"><p style="font-size: 25px" class="customfont">You are registered now, you can log in. Wait for moving you to main page or click there<a style="font-size: 25px; margin-right:auto;margin-left:auto; position:center" class="customfont" href="index.aspx" > Main Page</a>. </p> </asp:Label>
            </asp:Panel>

            <br />
            <p style="font-size: 40px" class="customfont">Comments</p>
            <asp:DataList Width="50%" DataKeyField="id_komentarze" ID="DataListCommentsofPost" runat="server" DataSourceID="SqlDataSource2" HorizontalAlign="Center" OnEditCommand="DataListCommentsofPost_EditCommand" OnUpdateCommand="DataListCommentsofPost_UpdateCommand" OnCancelCommand="DataListCommentsofPost_CancelCommand" OnDeleteCommand="DataListCommentsofPost_DeleteCommand">
                <ItemTemplate>
                    <asp:Label ID="LabelIdKomentarze" Visible="false" runat="server" Text='<%# Eval("id_komentarze") %>'></asp:Label>
                    <p class="tralala" style="color: #222;">
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT Posty.id_posty, Posty.p_link, Posty.p_data, Uzytkownik.u_nick FROM Posty INNER JOIN Uzytkownik ON Posty.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE Posty.id_posty=@id_posty ">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="id_posty" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PatrykRedzinskiConnectionString %>" SelectCommand="SELECT Komentarze.k_note, Komentarze.id_komentarze, Komentarze.k_data, Posty.p_link, Uzytkownik.u_nick, Komentarze.Posty_id_posty FROM Komentarze INNER JOIN Posty ON Komentarze.Posty_id_posty = Posty.id_posty INNER JOIN Uzytkownik ON Komentarze.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE (Komentarze.k_usun = 0) AND (Komentarze.Posty_id_posty = @id_posty)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="id_posty" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Label Visible="false" ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

