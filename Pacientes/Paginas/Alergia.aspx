<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/MasterPage.Master" AutoEventWireup="true" CodeBehind="Alergia.aspx.cs" Inherits="Pacientes.Paginas.Alergia" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:ScriptManager runat="server"></asp:ScriptManager>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>    
    <link href="../CSS/Styles.css" rel="stylesheet" />


     <asp:Panel HorizontalAlign="center" runat="server">

       

        <div id="tabela" class="divTabela" > 
            <table class="table table-bordered border-3 overflow-scroll w-75 text-center align-self-center" style="margin-left:auto; margin-right:auto;" >
                <thead class="thead-dark" style="background-color:black; color:white">
                    <tr>
                        <th>Código</th>
                        <th>Alergia</th>
                        <th>botao1</th>
                        <th>botao2</th>
                    </tr>
                </thead>
                <tbody>
                <%foreach (var obj in ListaAlergia) {%>
                    <tr>
                        <td><%=obj.ID%></td>
                        <td><%=obj.nome_alergia%></td>
                        <td><button class="btn border-primary">Detalhes</button></td>
                        <td><button class="btn-danger">Excluir</button></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
        <div>
                    
            <asp:Button ID="botaoModalInserir" class="btn btn-primary"  runat="server" text="Novo Paciente"/>
            <asp:Label ID="lblabel" runat="server" Text=""></asp:Label>
        </div>

</asp:Panel>
</asp:Content>
