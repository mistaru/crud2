<#import "parts/common.ftl" as c>
<@c.page>
    <input type="hidden" value="${playlist.id}" name="id">

    <h3 align="center" style="color:Black">Подробно: ${playlist.name}</h3>

    <div class="container text-center text-black">
            <form method="post" action="/playlist/addSongs/${playlist.id}">
                <input type="hidden" value="${playlist.id}" name="id">
                <div class="row">
                    <div>
                        <select name="nameSong" class="selectpicker">
                            <option selected="selected">Выбрать песню</option>
                            <#list Songs as s>
                                <option>${s.name}</option>
                            </#list>
                        </select>
                    </div>

                    <div class="col-auto">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary btn-sm">Добавить</button>
                    </div>
                </div>
            </form>
    </div>


    <div class="container py-5">
        <div class="row">
            <div class="col-lg-9 mx-auto bg-white rounded shadow">
                <div class="table-responsive">
                    <table class="table table-fixed">
                        <thead>
                        <tr>
                            <th scope="col" class="col-3">Название</th>
                            <th scope="col" class="col-3">Испольнитель</th>
                            <th scope="col" class="col-2">Альбом</th>
                            <th scope="col" class="col-2">Жанр</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if Song??>
                            <#list Song as Song>
                                <tr>
                                    <td class="col-3">${Song.name}</td>
                                    <td class="col-3">${Song.singer}</td>
                                    <td class="col-2">${Song.album}</td>
                                    <td class="col-2">${Song.style}</td>
                                </tr>
                            <#else>
                                Список пуст!
                            </#list>
                        </#if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</@c.page>