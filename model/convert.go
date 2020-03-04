package model

func UserToDTO(user *User, dtoUser *DTOUser) {
	dtoUser.ID = user.ID
	dtoUser.Username = user.Username
	dtoUser.Password = ""
	dtoUser.Gender = user.Gender
	dtoUser.CreatedAt = user.CreatedAt.Unix()
	dtoUser.AvatarUrl = user.AvatarUrl
}
