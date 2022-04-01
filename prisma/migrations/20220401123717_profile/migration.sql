-- CreateTable
CREATE TABLE "Profile" (
    "id" SERIAL NOT NULL,
    "userProfile" INTEGER NOT NULL,
    "profilePictureUrl" TEXT NOT NULL,
    "bio" VARCHAR(120) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userProfile_key" ON "Profile"("userProfile");

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userProfile_fkey" FOREIGN KEY ("userProfile") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
