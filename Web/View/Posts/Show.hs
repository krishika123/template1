module Web.View.Posts.Show where
import Web.View.Prelude
import qualified Text.MMark as MMark

data ShowView = ShowView { post :: Include "comments" Post  }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">Show Post</li>
            </ol>
        </nav>

        <div class="post-border">
            <div class="postrows">
                <div>
                    <h1>{post.title}</h1>
                </div>
                <div>
                    <p> {post.createdAt |> date} ({post.createdAt |>timeAgo})</p>
                </div>
            </div>
            <div> {post.body |> renderMarkdown} </div>
            <div class="post-ratings">
                <div> 
                    {post.likes}
                    <button> <img src="/thumbsUp.png" width="20px" height="20px"> </button>
                </div>
                <div>
                    {post.dislikes}
                    <button> <img src="/thumbsDown.png" width="20px" height="20px"> </button>
                </div>
            </div>
        </div>
        <div class="postComments-border">
            <div>
            <h1>Comments</h1>
            </div>
            <div> {forEach post.comments renderComment} </div>
            <a href={NewCommentAction post.id}>Add Comment</a>
        </div>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Posts" PostsAction
                            , breadcrumbText "Show Post"
                            ]

renderMarkdown text = 
    case text |>MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml
renderComment comment = [hsx|
        <div class="no-spacing">
            <div class="postrows">
                <div>
                    <h6>{comment.author}</h6>
                </div>
                <div>
                    <p>{comment.createdAt |> timeAgo}</p>
                </div>
            </div>
            <div class="postcolumn">
                <div>
                    <p>{comment.body}</p>
                </div>
            </div>
        </div>     
    |]
