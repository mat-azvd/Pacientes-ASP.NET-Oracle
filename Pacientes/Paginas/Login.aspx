<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pacientes.Paginas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/jquery.maskedinput.min.js"></script>
    <script type="text/javascript">
         jQuery(function ($) {
             $("#TextCpf").mask("999.999.999-99");
         });
    </script>
    
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="DIV_PRINCIPAl">
        <asp:Panel runat="server" ID="Panel_Principal">          
                <asp:label runat="server">Faça o Login </asp:label>
                <asp:TextBox runat="server" ID="TextCpf"  placeholder="CPF" ></asp:TextBox>
                <asp:TextBox runat="server" ID="TextSenha"  placeholder="Senha"></asp:TextBox>
                <asp:Button runat="server" ID="btEntrar" CssClass="botaoStyle" Text="Entrar" OnClick="btEntrar_Click" />
             </asp:Panel>
            </div>
       
    </form>
</body>
</html>
