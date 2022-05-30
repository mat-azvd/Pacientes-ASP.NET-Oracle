<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pacientes.Paginas.Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/jquery.maskedinput.min.js"></script>
    <script type="text/javascript">
         jQuery(function ($) {
             $("#TextCpf").mask("999.999.999-99");
             $('.data').mask('99/99/9999');
         });
    </script>
    
    <title></title>
</head>
<body>
     
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager> 
        <div id="DIV_PRINCIPAl">
        <asp:Panel runat="server" ID="Panel_Principal">          
                <asp:label runat="server">Faça seu Login </asp:label>
                <asp:TextBox runat="server" ID="TextCpf"  placeholder="CPF" ></asp:TextBox>
                <asp:TextBox runat="server" ID="TextSenha"  placeholder="Senha"></asp:TextBox>
                <asp:Button runat="server" ID="btEntrar" CssClass="botaoStyle" Text="Entrar" OnClick="btEntrar_Click" />
             <asp:Button ID="Button3" class="btn btn-primary" OnClick="modalTesteABrir" runat="server" text="TESTE"/>
            <asp:Label ID="Label1" runat="server"></asp:Label>
             </asp:Panel>
            </div>
        
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="teste" TargetControlID="Label1" CancelControlID="btnTeste" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel id="teste" runat="server">
        <asp:Label runat="server" Text="TESTEEEE"></asp:Label>
         <asp:TextBox runat="server" ID="TextBox1" class="data" placeholder="cadat" ></asp:TextBox>
        <asp:Button ID="btnTeste" runat="server"/>
    </asp:Panel>
       
    </form>
</body>
</html>
