import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { MongooseModule } from '@nestjs/mongoose';

@Module({
  imports: [MongooseModule.forRoot(process.env.MONGO_URI)],
  controllers: [AuthController],
  providers: [AuthService],
})
export class AuthModule {}
