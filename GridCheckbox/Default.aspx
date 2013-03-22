<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GridCheckbox.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <ext:ResourceManager runat="server"></ext:ResourceManager>
    <ext:Window runat="server" Title="Grid con Checkbox" Width="500" ButtonAlign="Center">
        <Items>
            <ext:GridPanel runat="server" ID="gridPersonas">
                <Store>
                    <ext:Store runat="server" ID="storePersonas">
                        <Model>
                            <ext:Model runat="server">
                                <Fields>
                                    <ext:ModelField Name="ID" Type="Int">
                                    </ext:ModelField>
                                    <ext:ModelField Name="Nombre" Type="String">
                                    </ext:ModelField>
                                    <ext:ModelField Name="Guardar" Type="Boolean">
                                    </ext:ModelField>
                                    <ext:ModelField Name="Guardar2" Type="Boolean">
                                    </ext:ModelField>
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column DataIndex="ID" Text="ID"></ext:Column>
                        <ext:Column DataIndex="Nombre" Text="Nombre"></ext:Column>
                        <ext:CheckColumn DataIndex="Guardar" Editable="true">
                        </ext:CheckColumn>
                        <ext:CheckColumn DataIndex="Guardar2" Editable="true">
                        </ext:CheckColumn>
                    </Columns>
                </ColumnModel>
            </ext:GridPanel>
        </Items>
        <Buttons>
            <ext:Button ID="botonGuardar" runat="server" Text="Guardar">
                <Listeners>
                    <Click Fn="onGuardar"></Click>
                </Listeners>
            </ext:Button>
        </Buttons>
    </ext:Window>

    <ext:XScript runat="server">
        <script>
            function onGuardar() {
                var store = #{storePersonas};
                var registros = store.getRecordsValues();
                var registrosEnviar = [];
                
                for (var i = 0; i < registros.length; i++) {
                    var registro = registros[i];

                    if (registro.Guardar === true || registro.Guardar2 === true)
                        registrosEnviar.push(
                            {
                                ID: registro.ID,
                                Nombre: registro.Nombre,
                                Guardar: registro.Guardar,
                                Guardar2: registro.Guardar2
                            }
                        );
                }

                App.direct.GuardarRegistrosMarcados(Ext.encode(registrosEnviar));                
            }
        </script>
    </ext:XScript>
    
</body>
</html>
