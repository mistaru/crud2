<#import "parts/common.ftl" as c>

<@c.page>
<h3>Список пользователей</h3>
<style>
    table, td, th {
        border: 1px solid #999;
        padding: 5px;
    }
</style>

<table>
    <thead>
    <tr>
        <th>Имя</th>
        <th>Роль</th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td><#list user.roles as role>${role}<#sep>, </#list></td>
        </tr>
    </#list>
    </tbody>
</table>
</@c.page>
