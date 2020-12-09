<#import "parts/common.ftl" as c>
<@c.page>

    <form method="post" action="/song/find/list1">
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
                <button class="btn btn-primary" type="submit">Поиск</button>
            </div>
        </div>
    </form>

    <br>

    <table id="tblData" class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Название</th>
            <th scope="col">Испольнитель</th>
            <th scope="col">Альбом</th>
            <th scope="col">Жанр</th>
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
                </tr>
            <#else>
                Список пуст!
            </#list>
        </#if>
    </table>
</@c.page>