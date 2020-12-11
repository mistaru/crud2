<#import "parts/common.ftl" as c>
<@c.page>
    <input type="hidden" value="${playlist.id}" name="id">

    <h3 align="center" style="color:Black">Подробно: ${playlist.name}</h3>

    <a href="/song/add"><svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-file-earmark-plus-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M2 2a2 2 0 0 1 2-2h5.293A1 1 0 0 1 10 .293L13.707 4a1 1 0 0 1 .293.707V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2zm7.5 1.5v-2l3 3h-2a1 1 0 0 1-1-1zM8.5 7a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V11a.5.5 0 0 0 1 0V9.5H10a.5.5 0 0 0 0-1H8.5V7z"/>
        </svg></a>
    <form method="post" action="/playlist/addSongs/${playlist.id}">
        <input type="hidden" value="${playlist.id}" name="id">

        <div>
            <select name="nameSong" class="custom-select">
                <option selected="selected">Выбрать песню</option>
                <#list Songs as s>
                    <option>${s.name}</option>
                </#list>
            </select>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div>
            <button type="submit" class="btn btn-danger">Добавить</button>
        </div>
    </form>

    <br>
    <br>
    <table id="tblData" class="table table-sm">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Название</th>
            <th scope="col">Испольнитель</th>
            <th scope="col">Альбом</th>
            <th scope="col">Жанр</th>
            <th scope="col">Действия</th>
        </tr>
        </thead>
        <tbody>
        <#if Song??>
            <#list Song as Song>
                <tr>
                    <td>${Song.name}</td>
                    <td>${Song.singer}</td>
                    <td>${Song.album}</td>
                    <td>${Song.style}</td>
                    <td>
                        <a href="/song/delete/${Song.id}" class="card-link">Удалить</a>
                    </td>
                </tr>
            <#else>
                Список пуст!
            </#list>
        </#if>
    </table>


</@c.page>