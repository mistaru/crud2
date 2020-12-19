<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/song/list">Музыка</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/song/my-list">Моя музыка</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/playlist/list">Мои каталоги</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/user/list">Список пользователей</a>
            </li>
            </#if>
        </ul>

        <div class="navbar-text mr-4">${name}</div>
        <#if known>
            <@l.logout />
        </#if>
        <#if !known>
            <a href="/login" class="btn btn-primary" role="button">Войти</a>
        </#if>

    </div>
</nav>
