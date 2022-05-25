<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="Pacientes.Paginas.Pacientes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/jquery.maskedinput.min.js"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            $("#txtCpf").mask("999.999.999-99");
        });
    </script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>    
    <link href="../CSS/Styles.css" rel="stylesheet" />
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <%--<script>
        $(function () {
            $("#modal-inserir").dialog({
                autoOpen: false,
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
    --%>

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
            <asp:Button ID="botaoModalInserir" class="btn btn-primary" OnClick="botaoModalInserir_Abrir" runat="server" text="Novo Paciente"/>
            <asp:Label ID="lblabel" runat="server" Text=""></asp:Label>
        </div>
    </asp:Panel>

         <ajaxToolkit:ModalPopupExtender ID="modalInserir" PopupControlID="PanelModalInserir" TargetControlID="lblabel" CancelControlID="botaoModalFechar1" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

         <asp:Panel ID="PanelModalInserir"  runat="server">         
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">                  
                        <h4 class="modal-title">Modal Header</h4>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>
                                <td><label>Nome</label></td>
                                <td><asp:TextBox  id="txtNome" runat="server"> </asp:TextBox></td>
                                <td><label>CPF</label></td>
                                <td><asp:TextBox  id="txtCpf" runat="server"> </asp:TextBox></td>                           
                            </tr>
                            <tr>
                                <td><label>Sexo</label></td>
                                <td><asp:TextBox id="txtSexo" runat="server"> </asp:TextBox></td>
                                <td><label>Data de Nascimento</label></td>
                                <td><asp:TextBox  id="txtData_nascimento" runat="server"> </asp:TextBox></td>  
                                
                            </tr>

                            <tr>                  
                                <td><label>Rua</label></td>
                                <td><asp:TextBox  id="txtRua" runat="server"> </asp:TextBox></td>
                                
                                <td><label>Numero</label></td>
                                <td><asp:TextBox  id="txtNumero" runat="server"> </asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td><label>Cidade</label></td>
                                <td><asp:TextBox  id="txtCidade" runat="server"> </asp:TextBox></td>
                                
                                <td><label>Estado</label></td>
                                <td><asp:DropDownList ID="txtEstado" runat="server" DataTextField="descricao" DataValueField="descricao" OnSelectedIndexChanged="txtEstado_SelectedIndexChanged1" Width="150px" >
                                    <asp:ListItem Selected="True"></asp:ListItem>
                                    </asp:DropDownList></td>
                                    
                                <%-- <td><asp:TextBox  id="txtEstado" runat="server"> </asp:TextBox></td> OnSelectedIndexChanged="txtEstado_SelectedIndexChanged"--%>
                                
                                                                    
                            </tr>

                            <tr>
                                <td><label>Complemento</label></td>
                                <td><asp:TextBox  id="txtComplemento" runat="server"> </asp:TextBox></td>
                                <td><label>Telefone</label></td>
                                <td><asp:TextBox  id="txtTelefone" runat="server"> </asp:TextBox></td>
                                
                            </tr>

                            <tr>
                                <td><label>Email</label></td>
                                <td><asp:TextBox  id="txtEmail" runat="server"> </asp:TextBox></td>
                                
                                <td><label>Estado Civil</label></td>
                                <td><asp:TextBox  id="txtEstado_civil" runat="server"> </asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td><label>Nome da Mãe</label></td>
                                <td><asp:TextBox  id="txtNome_mae" runat="server"> </asp:TextBox></td>
                                
                                <td><label>Alergias</label></td>
                                <td><asp:DropDownList id="txtAlergia" runat="server"> </asp:DropDownList></td>
                                
                            </tr>

                        </table>
                        </div>
                    <div class="modal-footer">
                        <asp:Button ID="botaoModalFechar1" CssClass="botaoStyle" runat="server" Text="Fechar" />
                        <asp:Button ID="botaoInserir" CssClass="botaoStyle" runat="server" Text="Inserir" OnClick="botaoInserir_Click1" />
                    </div>
                </div>
            </div>
        
       </asp:Panel> 
    
</asp:Content>
