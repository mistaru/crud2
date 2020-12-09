<#import "parts/common.ftl" as c>
<@c.page>

    <form method="post" action="/song/find/list2">
        <div class="row">
            <div class="col-auto">
                <input type="text" name="name" class="form-control" placeholder="Название"/>
            </div>
            <div class="col-auto">
                <input type="text" name="singer" class="form-control" placeholder="Испольнитель"/>
            </div>
            <div class="col-auto">
                <input type="text" name="album" class="form-control" placeholder="Альбом"/>
            </div>
            <div class="col-auto">
                <input type="text" name="style" class="form-control" placeholder="Жанр"/>
            </div>

            <div class="col-auto">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type="submit">Search</button>
            </div>
        </div>
    </form>



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