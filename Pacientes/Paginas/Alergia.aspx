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
         <br/>
         <br/>
          <div>                    
      
              <asp:Label ID="lblabel" runat="server" Text=""></asp:Label>
              <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
              <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
              <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
              <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
        </div>
         <asp:GridView ID="GridViewAlergia" HorizontalAlign="Center" 
                CssClass="table table-bordered border-3 overflow-scroll w-75 text-center align-self-center" style="margin-left:auto; margin-right:auto;"
                runat="server" AutoGenerateColumns="False"
                ShowHeaderWhenEmpty="True" EmptyDataText="Sem Alergias Cadastradas" 
                OnRowDeleting="GridViewAlergia_RowDeleting" 
                BackColor="White" BorderColor="black" BorderStyle="Solid" 
                BorderWidth="1px" CellPadding="15" ForeColor="Black" 
                GridLines="Both" AllowPaging="True" 
                
               PageSize="4" >
        
                <Columns>
                    <asp:BoundField HeaderText="Codigo" DataField="ID" />
                    <asp:BoundField HeaderText="Alergia" DataField="nome_alergia" />                                      
                    <asp:CommandField ControlStyle-CssClass="btn btn-danger" HeaderText="Ação2" ShowDeleteButton="True" />
                </Columns>
        
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="white" ForeColor="black"  HorizontalAlign="Center"  />
      
            </asp:GridView>
         <div>
        <asp:Button ID="botaoModalInserirAlergia" class="btn btn-primary" OnClick="botaoModalInserirAlergia_Abrir" runat="server" text="Nova Alergia"/>
            <br/>
             </div>
    <%--
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
                        <td><button runat="server" id="deleteAlergia" class="btn-danger" onclick="deleteAlergia_click">Excluir</button></td>
                        
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
         --%>
       
         
</asp:Panel>

    <ajaxToolkit:ModalPopupExtender ID="ModalInserirAlergia" PopupControlID="PanelInserirAlergia" TargetControlID="lblabel" CancelControlID="botaoModalFechar2" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

    <asp:Panel runat="server" ID="PanelInserirAlergia" CssClasss="PanelModalInserir" style = "display:none">

         <div class="modal-content" style="background-color:aqua">
                    <div class="modal-header">                  
                        <h4 class="modal-title">Modal Header</h4>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>
                                
                                <td><label>Nome da Alergia</label></td>
                                <td><asp:TextBox  id="txtNomeAlergia" type="text" runat="server"> </asp:TextBox></td>                                               
                              
                            </tr>           

                        </table>
                        </div>
                    <div class="modal-footer">
                        <asp:Button ID="botaoModalFechar2" CssClass="botaoStyle" runat="server" Text="Fechar" />
                        <asp:Button ID="botaoInserir2" CssClass="botaoStyle" runat="server" Text="Inserir" OnClick="botaoInserirAlergia_Click1" />
                    </div>
                </div>
     

    </asp:Panel>

    <ajaxToolkit:ModalPopupExtender ID="ErroModalAlergia" PopupControlID="PanelErroAlergia" TargetControlID="Label2" CancelControlID="botaoModalErroFechar1" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="PanelErroAlergia" CssClasss="PanelErro" style="display:none;">
         <div class="modal-content" style="background-color:red">
             <div id="header1" class="modal-header">
                 <h4 class="modal-title">Alergia ja cadastrada</h4>
             </div>
             <div id="footer1" class="modal-footer">
                 <asp:Button ID="botaoModalErroFechar1" CssClass="botaoStyle" runat="server" Text="Fechar" />
             </div>
         </div>
    </asp:Panel>

     <ajaxToolkit:ModalPopupExtender ID="OkModalAlergia" PopupControlID="OkPanellAlergia" TargetControlID="Label3"  CancelControlID="botaoOkModalFechar1" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

    <asp:Panel runat="server" ID="OkPanellAlergia" CssClasss="PanelErro" style="display:none;">
         <div class="modal-content" style="background-color:green">
             <div id="header2" class="modal-header">
                 <h4 class="modal-title">Cadastrada com Sucesso!</h4>
             </div>
             <div id="footer2" class="modal-footer">
                 <asp:Button ID="botaoOkModalFechar1" CssClass="botaoStyle" runat="server" Text="Fechar" OnClick="botaoOk_Fechar1"/>
             </div>
         </div>
    </asp:Panel>
  
    <ajaxToolkit:ModalPopupExtender ID="ConfirmaModalAlergia" PopupControlID="PanelConfirmaModalAlergia" TargetControlID="Label3" CancelControlID="botaoCancelar_Cancelar1" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

    <asp:Panel runat="server" ID="PanelConfirmaModalAlergia" CssClasss="PanelErro" style="display:none;">
         <div class="modal-content" style="background-color:green">
             <div id="header3" class="modal-header">
                 <h4 class="modal-title">Deseja excluir Alergia?</h4>
                   <asp:Label id="labelAlergiaCOD" Text="" runat="server"></asp:Label>
                  <asp:Label Visible="false" id="labelCOD1" Text="" runat="server"></asp:Label>
             </div>
             <div id="footer3" class="modal-footer">
                 <asp:Button ID="botaoOkModal_Confirma1" CssClass="btn-success" runat="server" Text="Confirmar" onClick="botaoConfirmaAlergia_Confirmar"/>
                 <asp:Button ID="botaoCancelar_Cancelar1" CssClass="btn-danger" runat="server" Text="Cancelar" />
             </div>
         </div>
    </asp:Panel>

    <ajaxToolkit:ModalPopupExtender ID="ModalErroDelete" PopupControlID="PanelErroDelete" TargetControlID="Label5" CancelControlID="botaoModalErroFechar3" runat="server" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="PanelErroDelete" CssClasss="PanelErro" style="display:none;">
         <div class="modal-content" style="background-color:red">
             <div id="header5" class="modal-header">
                 <h4 class="modal-title">Alergia possui pacientes cadastrados!</h4>
             </div>
             <div id="footer5" class="modal-footer">
                 <asp:Button ID="botaoModalErroFechar3" CssClass="botaoStyle" runat="server" Text="Fechar" />
             </div>
         </div>
    </asp:Panel>

</asp:Content>
