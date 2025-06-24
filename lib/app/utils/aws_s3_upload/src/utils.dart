import 'package:fskeleton/app/utils/aws_s3_upload/enum/acl.dart';

String aclToString(ACL acl) {
  switch (acl) {
    case ACL.private:
      return 'private';
    case ACL.publicRead:
      return 'public-read';
    case ACL.publicReadWrite:
      return 'public-read-write';
    case ACL.awsExecRead:
      return 'aws-exec-read';
    case ACL.authenticatedRead:
      return 'authenticated-read';
    case ACL.bucketOwnerRead:
      return 'bucket-owner-read';
    case ACL.bucketOwnerFullControl:
      return 'bucket-owner-full-control';
    case ACL.logDeliveryWrite:
      return 'log-delivery-write';
  }
}
