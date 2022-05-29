<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="Pacientes.Paginas.Pacientes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager runat="server"></asp:ScriptManager>

     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/css/bootstrap-multiselect.css" type="text/css"/>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/js/bootstrap-multiselect.js" ></script> 
   
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>    
    <link href="../CSS/Styles.css" rel="stylesheet" />

    
   
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

    <asp:Panel HorizontalAlign="center" runat="server">

        <div id="titulo">
            <asp:Label runat="server">LOGADO</asp:Label>
        </div>

        <div id="tabela" class="divTabela" > 
            <table class="table table-bordered border-3 overflow-scroll w-75 text-center align-self-center" style="margin-left:auto; margin-right:auto;" >
                <thead class="thead-dark" style="background-color:black; color:white">
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
                        <td><button class="btn border-primary">Detalhes</button></td>
                        <td><button class="btn-danger">Excluir</button></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
        <div>
            <%-- <a href="#" id="hlkShowLogin" class="link">Login</a>
                <asp:TextBox id="Text" runat="server"> </asp:TextBox>
                --%>
            
            <asp:Button ID="botaoModalInserir" class="btn btn-primary" OnClick="botaoModalInserir_Abrir" runat="server" text="Novo Paciente"/>
            <asp:Label ID="lblabel" runat="server" Text=""></asp:Label>
        </div>
<%--
<div id="divLoginDialog" class="overlayTeste">
<table cellspacing="0" cellpadding="2" style="margin-left:auto; margin-right:auto;">
<tr>
<td class="label">User Name:</td>
<td>
<asp:TextBox ID="txtUserName" ClientIDMode="Static"  runat="server"/>
<asp:TextBox ID="TextCpf"  runat="server"/>
<asp:RequiredFieldValidator ErrorMessage="User name required" 
ControlToValidate="txtUserName" runat="server" />
</td>
</tr>
<tr>
<td class="label">Password:</td>
<td>
<asp:TextBox ID="txtPassword" Mode="password" 
ClientIDMode="Static"  runat="server"/>
<asp:RequiredFieldValidator ErrorMessage="Password required" 
ControlToValidate="txtPassword" runat="server" />
</td>
</tr>
</table>
</div> --%>
    </asp:Panel>

         <ajaxToolkit:ModalPopupExtender ID="modalInserir" PopupControlID="PanelModalInserir" TargetControlID="lblabel" 
          CancelControlID="botaoModalFechar1" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

         <asp:Panel ID="PanelModalInserir" CssClasss="PanelModalInserir" style = "display:none"  runat="server">                         
                <div class="modal-content" style="background-color:aqua">
                    <div class="modal-header">                  
                        <h4 class="modal-title">Modal Header</h4>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>
                                
                                <td><label>Nome</label></td>
                                <td><asp:TextBox  id="txtNome" type="text" runat="server"> </asp:TextBox></td>
                                    
                                <td><label>CPF</label></td>
                                <td><asp:TextBox  ID="txtCpf" runat="server" > </asp:TextBox>
                                </td> 
                              
                            </tr>
                            <tr>
                                <td><label>Sexo</label></td>
                                <td><asp:TextBox id="txtSexo" runat="server"> </asp:TextBox></td>
                                <td><label>Data de Nascimento</label></td>
                                <td><asp:TextBox  id="txtData_nascimento" runat="server"> </asp:TextBox>
                                    
                                </td> 
                                    
                                
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
                                <td><asp:DropDownList ID="txtAlergia" runat="server" DataTextField="nome_alergia" DataValueField="nome_alergia" OnSelectedIndexChanged="txtAlergia_SelectedIndexChanged1" Width="150px">
                                </asp:DropDownList></td>
                               
                            </tr>                       

                        </table>
                        </div>
                    <div class="modal-footer">
                        <asp:Button ID="botaoModalFechar1" CssClass="botaoStyle" runat="server" Text="Fechar" />
                        <asp:Button ID="botaoInserir" CssClass="botaoStyle" runat="server" Text="Inserir" OnClick="botaoInserir_Click1" />
                    </div>
                </div>
                 
       </asp:Panel> 

    <ajaxToolkit:ModalPopupExtender ID="ErroModal" PopupControlID="PanelErro" TargetControlID="lblabel" 
          CancelControlID="botaoModalErroFechar" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

    <asp:Panel runat="server" ID="PanelErro" CssClasss="PanelErro" style = "display:none">
         <div class="modal-content" style="background-color:red">
             <div id="header1" class="modal-header">
                 <h4 class="modal-title">Paciente ja cadastrado</h4>
             </div>
             <div id="footer1" class="modal-footer">
                 <asp:Button ID="botaoModalErroFechar" CssClass="botaoStyle" runat="server" Text="Fechar" />
             </div>
         </div>
    </asp:Panel>

     <ajaxToolkit:ModalPopupExtender ID="OkModal" PopupControlID="PanelOk" TargetControlID="lblabel" 
         OkControlID="botaoOkModalFechar"
          CancelControlID="botaoOkModalFechar" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

    <asp:Panel runat="server" ID="PanelOk" CssClasss="PanelErro" style = "display:none">
         <div class="modal-content" style="background-color:green">
             <div id="header2" class="modal-header">
                 <h4 class="modal-title">Cadastrado com Sucesso!</h4>
             </div>
             <div id="footer2" class="modal-footer">
                 <asp:Button ID="botaoOkModalFechar" CssClass="botaoStyle" runat="server" Text="Fechar" OnClick="botaoOk_Fechar"/>
             </div>
         </div>
    </asp:Panel>

</asp:Content>


