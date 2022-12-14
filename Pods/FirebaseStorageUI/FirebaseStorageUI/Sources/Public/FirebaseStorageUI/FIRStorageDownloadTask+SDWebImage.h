//
//  Copyright (c) 2019 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#if __has_include(<FirebaseStorage/FirebaseStorage.h>)
  // Firebase 8.x
  #import <FirebaseStorage/FirebaseStorage.h>
#elif __has_include(<FirebaseStorage/FirebaseStorage-Swift.h>)
  // Firebase 9.0+
  #import <FirebaseStorage/FirebaseStorage-Swift.h>
#else
  @import FirebaseStorage;
#endif
#import <SDWebImage/SDWebImage.h>

NS_ASSUME_NONNULL_BEGIN

// `FIRStorageDownloadTask` conforms to `SDWebImageOperation` protocol
@interface FIRStorageDownloadTask (SDWebImage) <SDWebImageOperation>

@end

NS_ASSUME_NONNULL_END
