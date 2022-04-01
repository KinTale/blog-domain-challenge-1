const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function seed() {
    const createdUsers = await prisma.user.createMany({
        data: [
            { username: 'Alice', email: 'alice@email.com' },
            { username: 'Alan', email: 'alan2@email.com' }
        ]
    });

    console.log(`${createdUsers.count} users created`, createdUsers);

    // Add your code here
    const findAlice = await prisma.user.findFirst({
        where: {
            username: 'Alice'
        }
    })
    const findAlan = await prisma.user.findFirst({
        where: {
            username: 'Alan'
        }
    })

    const createProfile = await prisma.profile.createMany({
        data: [
            {
                userProfile: findAlice.id,
                profilePictureUrl: 'https://www.looper.com/img/gallery/things-only-adults-notice-in-alice-in-wonderland/l-intro-1602781527.jpg',
                bio: 'i am still chasing the bunny'
            },
            {
                userProfile: findAlan.id,
                profilePictureUrl: 'https://i.guim.co.uk/img/media/c934f6c10eec41acd1d527da908d30327ca0ed33/531_1170_3076_1845/master/3076.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=59c68e90c676a634b9b6d65988509472',
                bio: 'A true friend never asks of you what they know you would never ask of them.'
            }
        ]

    })

    const createPost = await prisma.post.createMany({
        data: [
            {
                userId: findAlice.id,
                title: 'i found him!',
                content: 'After many days, Mr White rabbit is insight!',
                post: true,
                pictureUrl: 'https://i.pinimg.com/564x/13/7e/12/137e12123410d9a616e447125ea98960.jpg'
            },
            {
                userId: findAlice.id,
                title: 'i lost him!',
                content: 'After many days finally catching up to Mr rabbit, i lost him again!',
                post: true,
            },
            {
                userId: findAlan.id,
                title: 'My upcoming shows!',
                content: 'Come and see me in my next show! buy tickets here - https://www.londontheatre.co.uk/whats-on/comedy',
                post: true,
            }
        ]
    })


    const createComment = await prisma.comment.create({
        data:
        {
            userId: findAlan.id,
            content: 'Thankyou everyone for coming to my show last night.'
        }

    })

    console.log(createProfile)
    console.log(createComment)
    // Don't edit any of the code below this line
    process.exit(0);
}

seed()
    .catch(async (error) => {
        console.error(error);
        await prisma.$disconnect();
        process.exit(1);
    })