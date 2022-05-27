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
                    
            <asp:Button ID="botaoModalInserirAlergia" class="btn btn-primary" OnClick="botaoModalInserirAlergia_Abrir" runat="server" text="Nova Alergia"/>
            <asp:Label ID="lblabel" runat="server" Text=""></asp:Label>
        </div>

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

</asp:Content>
