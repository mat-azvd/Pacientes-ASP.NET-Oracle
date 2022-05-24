<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="Pacientes.Paginas.Pacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server">

        <div id="titulo">
            <asp:Label runat="server">LOGADO</asp:Label>
        </div>

        <div id="tabela"> 
            <table>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>botao1</th>
                        <th>botao2</th>
                    </tr>
                </thead>
                <tbody>
                <%foreach (var obj in ListaPacientes) {%>
                    <tr>
                        <td><%=obj.nome%></td>
                        <td><%=obj.cpf%></td>
                        <td><button>Detalhes</button></td>
                        <td><button>Excluir</button></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>

    </asp:Panel>
</asp:Content>
