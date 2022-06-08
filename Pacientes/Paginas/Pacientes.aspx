<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="Pacientes.Paginas.Pacientes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager runat="server"></asp:ScriptManager>   
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>    
    <link href="../CSS/Styles.css" rel="stylesheet" />

     <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/jquery.maskedinput.min.js"></script>
    <script type="text/javascript">
        jQuery(function ($) {
            $('.txtCpf').mask("999.999.999-99");
            $('.data').mask('99/99/9999');
            $('.telefone').mask("(99)99999-9999");
        });
    </script>

    <asp:Panel HorizontalAlign="center" runat="server">

        <div id="titulo">
            <asp:Label runat="server">LOGADO</asp:Label>
        </div>     
       <br/>
        <div>
        <asp:TextBox ID="txtPesquisa" runat="server" placeholder="Digite CPF ou Nome"></asp:TextBox>
        <asp:Button ID="btnPesquisa" runat="server" text="Pesquisar" onclick="btnPesquisar_Click" />
         </div>
        <br/>
         <div id="formTabela" >
            <asp:GridView ID="GridViewPacientes" HorizontalAlign="Center" 
                CssClass="table table-bordered border-3 overflow-scroll w-75 text-center align-self-center" style="margin-left:auto; margin-right:auto;"
                runat="server" AutoGenerateColumns="False"
                ShowHeaderWhenEmpty="True" EmptyDataText="Sem Pacientes Cadastrados" 
                OnRowDeleting="GridViewPacientes_RowDeleting" 
                BackColor="White" BorderColor="black" BorderStyle="Solid" 
                BorderWidth="1px" CellPadding="15" ForeColor="Black" 
                GridLines="Both" AllowPaging="True" 
               OnPageIndexChanging="GridViewPacientes_PageIndexChanging" 
               OnSelectedIndexChanged="GridViewPacientes_SelectedIndexChanged1" PageSize="4" >
        
                <Columns>
                    <asp:BoundField HeaderText="Nome" DataField="nome" />
                    <asp:BoundField HeaderText="CPF" DataField="cpf" />
                   
                    <asp:CommandField ControlStyle-CssClass="btn btn-primary" HeaderText="Ação1" ShowSelectButton="True" SelectText="Editar" />
                    <asp:CommandField ControlStyle-CssClass="btn btn-danger" HeaderText="Ação2" ShowDeleteButton="True" />
                </Columns>
        
                <HeaderStyle BackColor="lightskyblue" Font-Bold="True" ForeColor="black" />
                <PagerStyle BackColor="white" ForeColor="black"  HorizontalAlign="Center"  />
      
            </asp:GridView> 
          
                <%-- <asp:Button ID="Button1" CssClass="botaoInserir" runat="server" Text="Inserir" OnClick="botaoModalInserir_Click" />
                <asp:Button ID="ButtonDownloadPDF" CssClass="botaoPDF" runat="server" Text="Download PFD" OnClick="ButtonDownloadPDF_Click" />--%>
           
              <div>                
            <asp:Button ID="botaoModalInserir" class="btn btn-primary" OnClick="botaoModalInserir_Abrir" runat="server" text="Novo Paciente"/>
            <asp:Button ID="ButtonDownloadPDF" class="btn btn-outline-danger" runat="server" Text="Download PFD" OnClick="ButtonDownloadPDF_Click" />
            <asp:Label ID="lblabel"  runat="server" Text=""></asp:Label>
            <asp:Label ID="Label2"  runat="server" Text=""></asp:Label>
            <asp:Label ID="Label3"  runat="server" Text=""></asp:Label>
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            
        </div>
        </div>

    </asp:Panel>
    

         <ajaxToolkit:ModalPopupExtender ID="modalInserir" PopupControlID="PanelModalInserir" TargetControlID="lblabel" CancelControlID="botaoModalFechar1" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
         <asp:Panel ID="PanelModalInserir" CssClasss="PanelModalInserir" style="display:none;" runat="server">       <%--  --%>                  
                <div class="modal-content" style="background-color:aqua">
                    <div class="modal-header">                  
                        <h4 class="modal-title">Modal Header</h4>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>
                                
                                <td><label>Nome</label></td>
                                <td><asp:TextBox  id="txtNome" type="text" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Digite um nome" ControlToValidate="txtNome" ForeColor="Red" ValidationGroup="validacao1" Text="*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ForeColor="Red" ErrorMessage="Nome Inválido" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao1" ControlToValidate="txtNome" Text="*"></asp:RegularExpressionValidator>
                                </td>
                                <td><label>CPF</label></td>
                                <td><asp:TextBox ID="txtCpf" class="txtCpf" runat="server" Width="188px" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Digite um CPF" ValidationGroup="validacao1" ForeColor="Red" ControlToValidate="txtCpf" Text="*"></asp:RequiredFieldValidator></td>
                            
                              
                            </tr>
                            <tr>
                                <td><label>Sexo</label></td>
                                <td><asp:TextBox id="txtSexo" runat="server"> </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Digite o Sexo" ValidationGroup="validacao1" ForeColor="Red"  ControlToValidate="txtSexo" Text="*"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  ForeColor="Red" ErrorMessage="Sexo Inválido" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao1" ControlToValidate="txtSexo" Text="*"></asp:RegularExpressionValidator>
                                </td>
                                <td><label>Data de Nascimento</label></td>
                                <td><asp:TextBox class="data" id="txtData_nascimento" runat="server"> </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Digite uma Data" ValidationGroup="validacao1" ForeColor="Red" ControlToValidate="txtData_nascimento" Text="*"></asp:RequiredFieldValidator></td>
                            </tr>

                            <tr>                  
                                <td><label>Rua</label></td>
                                <td><asp:TextBox  id="txtRua" runat="server"> </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Digite uma Rua" ValidationGroup="validacao1" ForeColor="Red" ControlToValidate="txtRua" Text="*"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  ForeColor="Red" ErrorMessage="Rua Inválida" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao1" ControlToValidate="txtRua" Text="*"></asp:RegularExpressionValidator>
                                </td>
                                <td><label>Numero</label></td>
                                <td><asp:TextBox  id="txtNumero" runat="server"> </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server"  ForeColor="Red" ErrorMessage="Numero Inválido" ValidationExpression="(^[\d]+$){1}" ValidationGroup="validacao1" ControlToValidate="txtNumero" Text="*"></asp:RegularExpressionValidator>
                                </td>
                                
                            </tr>
                            <tr>
                                <td><label>Cidade</label></td>
                                <td><asp:TextBox  id="txtCidade" runat="server"> </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"  ForeColor="Red" ErrorMessage="Cidade Invalida" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao1" ControlToValidate="txtCidade" Text="*"></asp:RegularExpressionValidator>
                                </td>
                                
                                <td><label>Estado</label></td>
                                <td><asp:DropDownList ID="txtEstado" runat="server" DataTextField="descricao" DataValueField="descricao" OnSelectedIndexChanged="txtEstado_SelectedIndexChanged1" Width="150px" >
                                    <asp:ListItem Selected="True"></asp:ListItem>
                                    </asp:DropDownList></td>
                                    
                                <%-- <td><asp:TextBox  id="txtEstado" runat="server"> </asp:TextBox></td> OnSelectedIndexChanged="txtEstado_SelectedIndexChanged"--%>
                                
                                                                    
                            </tr>

                            <tr>
                                <td><label>Complemento</label></td>
                                <td><asp:TextBox  id="txtComplemento" runat="server"> </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"  ForeColor="Red" ErrorMessage="Apenas Letras" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao1" ControlToValidate="txtComplemento" Text="*"></asp:RegularExpressionValidator>
                                </td>
                                <td><label>Telefone</label></td>
                                <td><asp:TextBox  id="txtTelefone" class="telefone" runat="server"> </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Digite um Telefone" ForeColor="Red" ValidationGroup="validacao1" ControlToValidate="txtTelefone" Text="*"></asp:RequiredFieldValidator></td>
                            </tr>

                            <tr>
                                <td><label>Email</label></td>
                                <td><asp:TextBox  id="txtEmail" runat="server" > </asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Email Inválido" ForeColor="Red" ValidationGroup="validacao1" ControlToValidate="txtEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" Text="*"></asp:RegularExpressionValidator>
                                </td>
                                <td><label>Estado Civil</label></td>
                                <td><asp:TextBox  id="txtEstado_civil" runat="server"> </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"  ForeColor="Red" ErrorMessage="Estado Civil Inválido" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao1" ControlToValidate="txtEstado_civil" Text="*"></asp:RegularExpressionValidator>
                                </td>
                                
                            </tr>
                            <tr>
                                <td><label>Nome da Mãe</label></td>
                                <td><asp:TextBox  id="txtNome_mae" runat="server"> </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"  ForeColor="Red" ErrorMessage="Nome da Mae Inválido" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao1" ControlToValidate="txtNome_mae" Text="*"></asp:RegularExpressionValidator>
                                </td>
                                
                                <td><label>Alergias</label></td>
                                <td><asp:DropDownList ID="txtAlergia" runat="server" DataTextField="nome_alergia" DataValueField="nome_alergia" OnSelectedIndexChanged="txtAlergia_SelectedIndexChanged1" Width="150px">
                                </asp:DropDownList></td>
                               
                            </tr>                       

                        </table>
                        </div>
                    <div class="modal-footer">
                        <asp:Button ID="botaoModalFechar1" CssClass="botaoStyle" runat="server" Text="Fechar" />
                        <asp:Button ID="botaoInserir" CssClass="botaoStyle" runat="server" Text="Inserir" OnClick="botaoInserir_Click1" ValidationGroup="validacao1" />
                    </div>
                    
                </div> 
             <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="validacao1" DisplayMode="List"/>
       </asp:Panel> 
    
    <ajaxToolkit:ModalPopupExtender ID="ErroModal" PopupControlID="PanelErro" TargetControlID="Label2" CancelControlID="botaoModalErroFechar" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="PanelErro" CssClasss="PanelErro" style="display:none;">
         <div class="modal-content" style="background-color:red">
             <div id="header1" class="modal-header">
                 <h4 class="modal-title">Paciente ja cadastrado</h4>
             </div>
             <div id="footer1" class="modal-footer">
                 <asp:Button ID="botaoModalErroFechar" CssClass="botaoStyle" runat="server" Text="Fechar" />
             </div>
         </div>
    </asp:Panel>

     <ajaxToolkit:ModalPopupExtender ID="OkModal" PopupControlID="PanelOk" TargetControlID="Label3"  CancelControlID="botaoOkModalFechar" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

    <asp:Panel runat="server" ID="PanelOk" CssClasss="PanelErro" style="display:none;">
         <div class="modal-content" style="background-color:green">
             <div id="header2" class="modal-header">
                 <h4 class="modal-title">Cadastrado com Sucesso!</h4>
             </div>
             <div id="footer2" class="modal-footer">
                 <asp:Button ID="botaoOkModalFechar" CssClass="botaoStyle" runat="server" Text="Fechar" OnClick="botaoOk_Fechar"/>
             </div>
         </div>
    </asp:Panel>
  
    <ajaxToolkit:ModalPopupExtender ID="ConfirmaModal" PopupControlID="PanelConfirmaModal" TargetControlID="Label4" CancelControlID="botaoCancelar_Cancelar" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

    <asp:Panel runat="server" ID="PanelConfirmaModal" CssClasss="PanelErro" style="display:none;">
         <div class="modal-content" style="background-color:green">
             <div id="header3" class="modal-header">
                 <h4 class="modal-title">Deseja excluir paciente?</h4>
                   <asp:Label id="labelNomeCOD" Text="" runat="server"></asp:Label>
                  <asp:Label Visible="false" id="labelCOD" Text="" runat="server"></asp:Label>
             </div>
             <div id="footer3" class="modal-footer">
                 <asp:Button ID="botaoOkModal_Confirma" CssClass="btn-success" runat="server" Text="Confirmar" onClick="botaoConfirma_Confirmar"/>
                 <asp:Button ID="botaoCancelar_Cancelar" CssClass="btn-danger" runat="server" Text="Cancelar" />
             </div>
         </div>
    </asp:Panel>
  
    <%-- MODAL EDITAR --%>

    <ajaxToolkit:ModalPopupExtender ID="ModalEditarPaciente" PopupControlID="PanelEditarPaciente" TargetControlID="lblabel" CancelControlID="btnModalEditarFechar" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
         <asp:Panel ID="PanelEditarPaciente" CssClasss="PanelModalInserir" style="display:none;"  runat="server">                         
                <div class="modal-content" style="background-color:aqua">
                    <div class="modal-header">                  
                        <h4 class="modal-title">Editar Paciente</h4>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>                                
                                <td><label>Nome</label></td>
                                <td><asp:TextBox  id="txtEditarNome" runat="server" Text=""> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtEditarNome" ForeColor="Red" ValidationGroup="validacao2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"  ForeColor="Red" ErrorMessage="*" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao2" ControlToValidate="txtEditarNome"></asp:RegularExpressionValidator>
                                </td>
                                <td><label>CPF</label></td>
                                <td><asp:TextBox  ID="txtEditarCpf" class="txtCpf" runat="server"  Text=""> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ValidationGroup="validacao2" ForeColor="Red" ControlToValidate="txtEditarCpf"></asp:RequiredFieldValidator>
                                </td>                               
                            </tr>
                            <tr>
                                <td><label>Sexo</label></td>
                                <td><asp:TextBox id="txtEditarSexo" runat="server" Text=""> </asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtEditarSexo" ForeColor="Red" ValidationGroup="validacao2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"  ForeColor="Red" ErrorMessage="*" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao2" ControlToValidate="txtEditarSexo"></asp:RegularExpressionValidator>
                                </td>
                                <td><label>Data de Nascimento</label></td>
                                <td><asp:TextBox  id="txtEditarNasci" runat="server" class="data" Text=""> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ValidationGroup="validacao2" ForeColor="Red" ControlToValidate="txtEditarNasci"></asp:RequiredFieldValidator>
                                </td>                                                                  
                            </tr>

                            <tr>                  
                                <td><label>Rua</label></td>
                                <td><asp:TextBox  id="txtEditarRua" runat="server" Text=""> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="txtEditarRua" ForeColor="Red" ValidationGroup="validacao2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"  ForeColor="Red" ErrorMessage="*" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao2" ControlToValidate="txtEditarRua"></asp:RegularExpressionValidator>
                                </td>
                                
                                <td><label>Numero</label></td>
                                <td><asp:TextBox  id="txtEditarNumero" runat="server" Text=""> </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server"  ForeColor="Red" ErrorMessage="*" ValidationExpression="(^[\d]+$){1}" ValidationGroup="validacao2" ControlToValidate="txtEditarNumero"></asp:RegularExpressionValidator>
                                </td>
                                
                            </tr>
                            <tr>
                                <td><label>Cidade</label></td>
                                <td><asp:TextBox  id="txtEditarCidade" runat="server" Text=""> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="txtEditarCidade" ForeColor="Red" ValidationGroup="validacao2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"  ForeColor="Red" ErrorMessage="*" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao2" ControlToValidate="txtEditarCidade"></asp:RegularExpressionValidator>
                                </td>
                                
                                <td><label>Estado</label></td>
                                <td><asp:DropDownList ID="txtEditarEstado" runat="server" DataTextField="descricao" DataValueField="descricao" OnSelectedIndexChanged="txtEditarEstado_SelectedIndexChanged1" Width="150px" >
                                    <%-- <asp:ListItem Selected="True"></asp:ListItem> --%>
                                    </asp:DropDownList></td>
                                    
                                <%-- <td><asp:TextBox  id="txtEstado" runat="server"> </asp:TextBox></td> OnSelectedIndexChanged="txtEstado_SelectedIndexChanged"--%>
                                
                                                                    
                            </tr>

                            <tr>
                                <td><label>Complemento</label></td>
                                <td><asp:TextBox  id="txtEditarComplemento" runat="server" Text=""> </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"  ForeColor="Red" ErrorMessage="*" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao2" ControlToValidate="txtEditarComplemento"></asp:RegularExpressionValidator>
                                </td>
                                <td><label>Telefone</label></td>
                                <td><asp:TextBox  id="txtEditarTelefone" class="telefone" runat="server" Text=""> </asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="txtEditarTelefone" ForeColor="Red" ValidationGroup="validacao2"></asp:RequiredFieldValidator>
                                </td>
                                
                            </tr>

                            <tr>
                                <td><label>Email</label></td>
                                <td><asp:TextBox  id="txtEditarEmail" runat="server" Text="" placeholder="Pendente"> </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="validacao2" ControlToValidate="txtEditarEmail" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                                </td>
                                
                                <td><label>Estado Civil</label></td>
                                <td><asp:TextBox  id="txtEditarEstadoCivil" runat="server" Text="" placeholder="Pendente"> </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server"  ForeColor="Red" ErrorMessage="*" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao2" ControlToValidate="txtEditarEstadoCivil"></asp:RegularExpressionValidator>
                                </td>
                                
                            </tr>
                            <tr>
                                <td><label>Nome da Mãe</label></td>
                                <td><asp:TextBox  id="txtEditarMae" runat="server" Text=""> </asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server"  ForeColor="Red" ErrorMessage="*" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="validacao2" ControlToValidate="txtEditarMae"></asp:RegularExpressionValidator>
                                </td>
                                
                                <td><label>Alergias</label></td>
                                <td><asp:DropDownList  ID="txtEditarAlergia" runat="server" DataTextField="nome_alergia" DataValueField="nome_alergia" OnSelectedIndexChanged="txtEditarAlergia_SelectedIndexChanged" Width="150px">
                                </asp:DropDownList></td>
                               
                            </tr>                       

                        </table>
                        </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnModalEditarFechar" CssClass="botaoStyle" runat="server" Text="Fechar" />
                        <asp:Button ID="btnModalEditar" CssClass="botaoStyle" runat="server" Text="Atualizar" OnClick="botaoEditarOK_Click" ValidationGroup="validacao2"  /> <%-- --%>
                    </div>
                </div>                 
       </asp:Panel>
    
</asp:Content>


