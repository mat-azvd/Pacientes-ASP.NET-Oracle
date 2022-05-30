<%@ Page Title="" Language="C#" MasterPageFile="~/Paginas/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pacientes.aspx.cs" Inherits="Pacientes.Paginas.Pacientes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager runat="server"></asp:ScriptManager>   
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>    
    <link href="../CSS/Styles.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function(){
            $('.data').mask('00/00/0000');
    </script>

    <asp:Panel HorizontalAlign="center" runat="server">

        <div id="titulo">
            <asp:Label runat="server">LOGADO</asp:Label>
        </div>     
       

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
               OnSelectedIndexChanged="GridViewPacientes_SelectedIndexChanged1" >
        
                <Columns>
                    <asp:BoundField HeaderText="Nome" DataField="nome" />
                    <asp:BoundField HeaderText="CPF" DataField="cpf" />
                   
                    <asp:CommandField ControlStyle-CssClass="btn btn-primary" HeaderText="Ação1" ShowSelectButton="True" SelectText="Editar" />
                    <asp:CommandField ControlStyle-CssClass="btn-danger" HeaderText="Ação2" ShowDeleteButton="True" />
                </Columns>
        
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="white" ForeColor="black"  HorizontalAlign="Center"  />
      
            </asp:GridView> 
          
                <%-- <asp:Button ID="Button1" CssClass="botaoInserir" runat="server" Text="Inserir" OnClick="botaoModalInserir_Click" />
                <asp:Button ID="ButtonDownloadPDF" CssClass="botaoPDF" runat="server" Text="Download PFD" OnClick="ButtonDownloadPDF_Click" />--%>
           
              <div>                
            <asp:Button ID="botaoModalInserir" class="btn btn-primary" OnClick="botaoModalInserir_Abrir" runat="server" text="Novo Paciente"/>
            <asp:Label ID="lblabel"  runat="server" Text=""></asp:Label>
            <asp:Label ID="Label2"  runat="server" Text=""></asp:Label>
            <asp:Label ID="Label3"  runat="server" Text=""></asp:Label>
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
             <asp:Button ID="Button3" class="btn btn-primary" OnClick="modalTesteABrir" runat="server" text="TESTE"/>
        </div>
        </div>

    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="teste" TargetControlID="Label1" CancelControlID="btnTeste" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel id="teste" runat="server">
        <asp:Label runat="server" Text="TESTEEEE"></asp:Label>
        <asp:Button ID="btnTeste" runat="server"/>
    </asp:Panel>

         <ajaxToolkit:ModalPopupExtender ID="modalInserir" PopupControlID="PanelModalInserir" TargetControlID="lblabel" CancelControlID="botaoModalFechar1" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
         <asp:Panel ID="PanelModalInserir" CssClasss="PanelModalInserir" style="display:none;"  runat="server">                         
                <div class="modal-content" style="background-color:aqua">
                    <div class="modal-header">                  
                        <h4 class="modal-title">Modal Header</h4>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>
                                
                                <td><label>Nome</label></td>
                                <td><asp:TextBox  id="txtNome" type="text" runat="server"></asp:TextBox></td>
                                    
                                <td><label>CPF</label></td>
                                <td><asp:TextBox ID="txtCpf" runat="server" > </asp:TextBox>
                                
                                    
                                
                                </td> 
                              
                            </tr>
                            <tr>
                                <td><label>Sexo</label></td>
                                <td><asp:TextBox id="txtSexo" runat="server"> </asp:TextBox></td>
                                <td><label>Data de Nascimento</label></td>
                                <td><asp:TextBox class="data" id="txtData_nascimento" runat="server"> </asp:TextBox></td>                                                                  
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

     <ajaxToolkit:ModalPopupExtender ID="OkModal" PopupControlID="PanelOk" TargetControlID="Label3" OkControlID="botaoOkModalFechar" CancelControlID="botaoOkModalFechar" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

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
                        <h4 class="modal-title">Modal Header</h4>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>                                
                                <td><label>Nome</label></td>
                                <td><asp:TextBox  id="txtEditarNome" runat="server" Text=""> </asp:TextBox></td>                                    
                                <td><label>CPF</label></td>
                                <td><asp:TextBox  ID="txtEditarCpf" runat="server"  Text=""> </asp:TextBox>
                                </td>                               
                            </tr>
                            <tr>
                                <td><label>Sexo</label></td>
                                <td><asp:TextBox id="txtEditarSexo" runat="server" Text=""> </asp:TextBox></td>
                                <td><label>Data de Nascimento</label></td>
                                <td><asp:TextBox  id="txtEditarNasci" runat="server" Text=""> </asp:TextBox></td>                                                                  
                            </tr>

                            <tr>                  
                                <td><label>Rua</label></td>
                                <td><asp:TextBox  id="txtEditarRua" runat="server" Text=""> </asp:TextBox></td>
                                
                                <td><label>Numero</label></td>
                                <td><asp:TextBox  id="txtEditarNumero" runat="server" Text=""> </asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td><label>Cidade</label></td>
                                <td><asp:TextBox  id="txtEditarCidade" runat="server" Text=""> </asp:TextBox></td>
                                
                                <td><label>Estado</label></td>
                                <td><asp:DropDownList ID="txtEditarEstado" runat="server" DataTextField="descricao" DataValueField="descricao" OnSelectedIndexChanged="txtEditarEstado_SelectedIndexChanged1" Width="150px" >
                                    <%-- <asp:ListItem Selected="True"></asp:ListItem> --%>
                                    </asp:DropDownList></td>
                                    
                                <%-- <td><asp:TextBox  id="txtEstado" runat="server"> </asp:TextBox></td> OnSelectedIndexChanged="txtEstado_SelectedIndexChanged"--%>
                                
                                                                    
                            </tr>

                            <tr>
                                <td><label>Complemento</label></td>
                                <td><asp:TextBox  id="txtEditarComplemento" runat="server" Text=""> </asp:TextBox></td>
                                <td><label>Telefone</label></td>
                                <td><asp:TextBox  id="txtEditarTelefone" runat="server" Text=""> </asp:TextBox></td>
                                
                            </tr>

                            <tr>
                                <td><label>Email</label></td>
                                <td><asp:TextBox  id="txtEditarEmail" runat="server" Text=""> </asp:TextBox></td>
                                
                                <td><label>Estado Civil</label></td>
                                <td><asp:TextBox  id="txtEditarEstadoCivil" runat="server" Text=""> </asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td><label>Nome da Mãe</label></td>
                                <td><asp:TextBox  id="txtEditarMae" runat="server" Text=""> </asp:TextBox></td>
                                
                                <td><label>Alergias</label></td>
                                <td><asp:DropDownList  ID="txtEditarAlergia" runat="server" DataTextField="nome_alergia" DataValueField="nome_alergia" OnSelectedIndexChanged="txtEditarAlergia_SelectedIndexChanged" Width="150px">
                                </asp:DropDownList></td>
                               
                            </tr>                       

                        </table>
                        </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnModalEditarFechar" CssClass="botaoStyle" runat="server" Text="Fechar" />
                        <asp:Button ID="btnModalEditar" CssClass="botaoStyle" runat="server" Text="Atualizar" OnClick="botaoEditarOK_Click"  /> <%-- --%>
                    </div>
                </div>                 
       </asp:Panel>
    
</asp:Content>


