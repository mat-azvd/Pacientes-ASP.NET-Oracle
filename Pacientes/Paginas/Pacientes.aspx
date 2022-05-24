<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="Pacientes.Paginas.Pacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../Scripts/jquery-3.6.0.intellisense.js"></script>
    <script src="../Scripts/jquery-3.6.0.js"></script>
    <script src="../Scripts/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#modal-inserir").dialog({
                
                show: {
                    effect: "blind",
                    duration: 1000
                },
                hide: {
                    effect: "explode",
                    duration: 1000
                }
            });
            $("#abrir-modal").click(function () {
                $("#modal-inserir").dialog("open");
            });
        });
    </script>

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
        <div>
            <button id="abrir-modal">Novo Paciente</button>
        </div>

        <div id="modal-inserir">

            <table>

                <tr>
                    <td><label>Nome</label></td>
                    <td><input type="text" value=""/></td>
                    <td><label>CPF</label></td>
                    <td><input type="text" value=""/></td>
                    <td><label>Sexo</label></td>
                    <td><input type="text" value=""/></td>
                    <td><label>Data de Nascimento</label></td>
                    <td><input type="date" value=""/></td>
                </tr>

                <tr>                  
                    <td><label>Rua</label></td>
                    <td><input type="text" value=""/></td>
                    <td><label>Numero</label></td>
                    <td><input type="number" value=""/></td>
                    <td><label>Cidade</label></td>
                    <td><input type="text" value=""/></td>
                    <td><label>Estado</label></td>
                    <td><input type="number" value=""/></td>                                      
                </tr>

                <tr>
                    <td><label>Complemento</label></td>
                    <td><input type="text" value=""/></td>
                </tr>

                <tr>
                    <td><label>Email</label></td>
                    <td><input type="text" value=""/></td>
                    <td><label>Estado Civil</label></td>
                    <td><input type="text" value=""/></td>
                    <td><label>Nome da Mãe</label></td>
                    <td><input type="text" value=""/></td>
                    <td><label>Alergias</label></td>
                    <td><input type="text" value=""/></td>
                </tr>

            </table>

        </div>

    </asp:Panel>
</asp:Content>
