<#import "parts/common.ftl" as c>
<@c.page>
    <a href="/song/add">ДОБАВИТЬ</a>
      <br>
      <br>
    <table id="tblData" class="table">
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
                        <a href="/song/edit/${Song.id}" class="card-link">Редактировать</a>
                        <a href="/song/delete/${Song.id}" class="card-link">Удалить</a>
                    </td>
                </tr>
            <#else>
                Список пуст!
            </#list>
        </#if>
    </table>
</@c.page>