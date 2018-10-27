<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Feedback
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .style2 {
            width: 124px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" Runat="Server">
    
    <center>
        <h3>Please provide your valueable Feedback.</h3>
    <br />
        <asp:Image ID="Image1" runat="server" ImageUrl="https://media0.giphy.com/media/uRPf6qhtwjzyM/giphy.gif" Height="150px" Width="150px" />;
    </center>
    <br />
    <span class="style1"><strong>For any query you can directly mail us at <a href="mailto:YOUR EMAIL ID">ruparelcafe@gmail.com</a></strong></span>
<br />
 <br />
    <table>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
            </td>
            <td class="style2"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cannot be left blank." ControlToValidate="TextBox1">
                </asp:RequiredFieldValidator> 
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="Email">
                </asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="TextBox2" runat="server" Width="343px">
                </asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Cannot be left blank" ControlToValidate="TextBox2">
                </asp:RequiredFieldValidator>
<br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Provide a valid Email ID" ControlToValidate="TextBox2" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                </asp:RegularExpressionValidator>         
           </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="Comments"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="TextBox3" runat="server" Height="164px" TextMode="MultiLine" Width="343px"></asp:TextBox>
                <br />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Cannot be left blank" ControlToValidate="TextBox3">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Button1" runat="server" Text="Send Feedback" Height="40px" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>