package model

type DTOLike struct {
	UserID     uint  `json:"user_id"`
	ActivityID uint  `json:"activity_id"`
	CreatedAt  int64 `json:"created_at"`
}

type DTOPost struct {
	UserID    uint   `json:"user_id"`
	Text      string `json:"text"`
	CreatedAt int64  `json:"created_at"`
}

type DTOUser struct {
	ID       uint   `json:"id"`
	Username string `json:"username"`
	Password string `json:"password"`

	AvatarUrl string `json:"avatar_url"`
	Email     string `json:"email"`
	Gender    string `json:"gender"`
	CreatedAt int64  `json:"created_at"`
}

type DTOToken struct {
	AccessToken string  `json:"access_token"`
	User        DTOUser `json:"user"`
}

type TokenError struct {
	Error            string `json:"error"`
	ErrorDescription string `json:"error_description"`
}
