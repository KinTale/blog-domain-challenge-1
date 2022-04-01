-- CreateTable
CREATE TABLE "Comment" (
    "id" SERIAL NOT NULL,
    "userProfile" INTEGER NOT NULL,
    "content" VARCHAR(250) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userProfile_fkey" FOREIGN KEY ("userProfile") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
