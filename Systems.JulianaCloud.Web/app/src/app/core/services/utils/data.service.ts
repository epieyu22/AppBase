import { Injectable } from "@angular/core";
import { Observable, Subject } from "rxjs";
import { filter } from "rxjs/operators"

export enum AppEventType {
    ClickedOnNotification = 'CLICKED_ON_NOTIFICATION',
    SocketEvent = 'SOCKET_EVENT',
  }

export class AppEvent<T> {
    constructor(
      public type: AppEventType,
      public payload: T,
    ) {}
  }

@Injectable()
export class EventQueueService {

  private eventBrocker = new Subject<AppEvent<any>>();

  on(eventType: AppEventType): Observable<AppEvent<any>> {
    return this.eventBrocker.pipe(filter(event => event.type === eventType));
  }

  dispatch<T>(event: AppEvent<T>): void {
    this.eventBrocker.next(event);
  }

}