; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"lcg_next"(i64 %state) nounwind {
entry:
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t9 = load i64, ptr %local.state
  %t10 = mul i64 %t9, 1664525
  %t11 = add i64 %t10, 1013904223
  ret i64 %t11
}

define i64 @"lcg_f64"(i64 %state) nounwind {
entry:
  %local.s.12 = alloca i64
  %local.state = alloca i64
  store i64 %state, ptr %local.state
  %t13 = load i64, ptr %local.state
  store i64 %t13, ptr %local.s.12
  %t14 = load i64, ptr %local.s.12
  %t15 = icmp slt i64 %t14, 0
  %t16 = zext i1 %t15 to i64
  %t17 = icmp ne i64 %t16, 0
  br i1 %t17, label %then1, label %else1
then1:
  %t18 = load i64, ptr %local.s.12
  %t19 = sub i64 0, %t18
  store i64 %t19, ptr %local.s.12
  br label %then1_end
then1_end:
  br label %endif1
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t20 = phi i64 [ 0, %then1_end ], [ 0, %else1_end ]
  %t21 = load i64, ptr %local.s.12
  %t22 = srem i64 %t21, 10000
  %t23 = call i64 @"sx_int_to_f64"(i64 %t22)
  %t24 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.2)
  %t25 = call i64 @"sx_f64_div"(i64 %t23, i64 %t24)
  ret i64 %t25
}

define i64 @"beta_mean"(i64 %a, i64 %b) nounwind {
entry:
  %local.a = alloca i64
  store i64 %a, ptr %local.a
  %local.b = alloca i64
  store i64 %b, ptr %local.b
  %t26 = load i64, ptr %local.a
  %t27 = load i64, ptr %local.a
  %t28 = load i64, ptr %local.b
  %t29 = call i64 @"sx_f64_add"(i64 %t27, i64 %t28)
  %t30 = call i64 @"sx_f64_div"(i64 %t26, i64 %t29)
  ret i64 %t30
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t31 = load i64, ptr %local.x
  %t32 = load i64, ptr %local.lo
  %t33 = call i64 @"sx_f64_lt"(i64 %t31, i64 %t32)
  %t34 = icmp ne i64 %t33, 0
  br i1 %t34, label %then2, label %else2
then2:
  %t35 = load i64, ptr %local.lo
  ret i64 %t35
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t36 = phi i64 [ 0, %else2_end ]
  %t37 = load i64, ptr %local.x
  %t38 = load i64, ptr %local.hi
  %t39 = call i64 @"sx_f64_gt"(i64 %t37, i64 %t38)
  %t40 = icmp ne i64 %t39, 0
  br i1 %t40, label %then3, label %else3
then3:
  %t41 = load i64, ptr %local.hi
  ret i64 %t41
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t42 = phi i64 [ 0, %else3_end ]
  %t43 = load i64, ptr %local.x
  ret i64 %t43
}

define i64 @"train_stationary"(i64 %lambda, i64 %true_val, i64 %obs, i64 %seed) nounwind {
entry:
  %local.al.44 = alloca i64
  %local.be.45 = alloca i64
  %local.rng.46 = alloca i64
  %local.step.47 = alloca i64
  %local.total_err.48 = alloca i64
  %local.err.49 = alloca i64
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t50 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.3)
  store i64 %t50, ptr %local.al.44
  %t51 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.4)
  store i64 %t51, ptr %local.be.45
  %t52 = load i64, ptr %local.seed
  store i64 %t52, ptr %local.rng.46
  store i64 0, ptr %local.step.47
  %t53 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.5)
  store i64 %t53, ptr %local.total_err.48
  br label %loop4
loop4:
  %t54 = load i64, ptr %local.step.47
  %t55 = load i64, ptr %local.obs
  %t56 = icmp slt i64 %t54, %t55
  %t57 = zext i1 %t56 to i64
  %t58 = icmp ne i64 %t57, 0
  br i1 %t58, label %body4, label %endloop4
body4:
  %t59 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.6)
  %t60 = load i64, ptr %local.al.44
  %t61 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.7)
  %t62 = call i64 @"sx_f64_sub"(i64 %t60, i64 %t61)
  %t63 = load i64, ptr %local.lambda
  %t64 = call i64 @"sx_f64_mul"(i64 %t62, i64 %t63)
  %t65 = call i64 @"sx_f64_add"(i64 %t59, i64 %t64)
  store i64 %t65, ptr %local.al.44
  %t66 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.8)
  %t67 = load i64, ptr %local.be.45
  %t68 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.9)
  %t69 = call i64 @"sx_f64_sub"(i64 %t67, i64 %t68)
  %t70 = load i64, ptr %local.lambda
  %t71 = call i64 @"sx_f64_mul"(i64 %t69, i64 %t70)
  %t72 = call i64 @"sx_f64_add"(i64 %t66, i64 %t71)
  store i64 %t72, ptr %local.be.45
  %t73 = load i64, ptr %local.rng.46
  %t74 = call i64 @"lcg_next"(i64 %t73)
  store i64 %t74, ptr %local.rng.46
  %t75 = load i64, ptr %local.rng.46
  %t76 = call i64 @"lcg_f64"(i64 %t75)
  %t77 = load i64, ptr %local.true_val
  %t78 = call i64 @"sx_f64_lt"(i64 %t76, i64 %t77)
  %t79 = icmp ne i64 %t78, 0
  br i1 %t79, label %then5, label %else5
then5:
  %t80 = load i64, ptr %local.al.44
  %t81 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.10)
  %t82 = call i64 @"sx_f64_add"(i64 %t80, i64 %t81)
  store i64 %t82, ptr %local.al.44
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t83 = load i64, ptr %local.be.45
  %t84 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.11)
  %t85 = call i64 @"sx_f64_add"(i64 %t83, i64 %t84)
  store i64 %t85, ptr %local.be.45
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t86 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t87 = load i64, ptr %local.al.44
  %t88 = load i64, ptr %local.be.45
  %t89 = call i64 @"beta_mean"(i64 %t87, i64 %t88)
  %t90 = load i64, ptr %local.true_val
  %t91 = call i64 @"sx_f64_sub"(i64 %t89, i64 %t90)
  store i64 %t91, ptr %local.err.49
  %t92 = load i64, ptr %local.total_err.48
  %t93 = load i64, ptr %local.err.49
  %t94 = load i64, ptr %local.err.49
  %t95 = call i64 @"sx_f64_mul"(i64 %t93, i64 %t94)
  %t96 = call i64 @"sx_f64_add"(i64 %t92, i64 %t95)
  store i64 %t96, ptr %local.total_err.48
  %t97 = load i64, ptr %local.step.47
  %t98 = add i64 %t97, 1
  store i64 %t98, ptr %local.step.47
  br label %loop4
endloop4:
  %t99 = load i64, ptr %local.total_err.48
  %t100 = load i64, ptr %local.obs
  %t101 = call i64 @"sx_int_to_f64"(i64 %t100)
  %t102 = call i64 @"sx_f64_div"(i64 %t99, i64 %t101)
  ret i64 %t102
}

define i64 @"train_changing"(i64 %lambda, i64 %val1, i64 %val2, i64 %switch_at, i64 %obs, i64 %seed) nounwind {
entry:
  %local.al.103 = alloca i64
  %local.be.104 = alloca i64
  %local.rng.105 = alloca i64
  %local.step.106 = alloca i64
  %local.total_err.107 = alloca i64
  %local.true_val.108 = alloca i64
  %local.err.109 = alloca i64
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.val1 = alloca i64
  store i64 %val1, ptr %local.val1
  %local.val2 = alloca i64
  store i64 %val2, ptr %local.val2
  %local.switch_at = alloca i64
  store i64 %switch_at, ptr %local.switch_at
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t110 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.12)
  store i64 %t110, ptr %local.al.103
  %t111 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.13)
  store i64 %t111, ptr %local.be.104
  %t112 = load i64, ptr %local.seed
  store i64 %t112, ptr %local.rng.105
  store i64 0, ptr %local.step.106
  %t113 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.14)
  store i64 %t113, ptr %local.total_err.107
  %t114 = load i64, ptr %local.val1
  store i64 %t114, ptr %local.true_val.108
  br label %loop6
loop6:
  %t115 = load i64, ptr %local.step.106
  %t116 = load i64, ptr %local.obs
  %t117 = icmp slt i64 %t115, %t116
  %t118 = zext i1 %t117 to i64
  %t119 = icmp ne i64 %t118, 0
  br i1 %t119, label %body6, label %endloop6
body6:
  %t120 = load i64, ptr %local.step.106
  %t121 = load i64, ptr %local.switch_at
  %t122 = icmp eq i64 %t120, %t121
  %t123 = zext i1 %t122 to i64
  %t124 = icmp ne i64 %t123, 0
  br i1 %t124, label %then7, label %else7
then7:
  %t125 = load i64, ptr %local.val2
  store i64 %t125, ptr %local.true_val.108
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t126 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t127 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.15)
  %t128 = load i64, ptr %local.al.103
  %t129 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.16)
  %t130 = call i64 @"sx_f64_sub"(i64 %t128, i64 %t129)
  %t131 = load i64, ptr %local.lambda
  %t132 = call i64 @"sx_f64_mul"(i64 %t130, i64 %t131)
  %t133 = call i64 @"sx_f64_add"(i64 %t127, i64 %t132)
  store i64 %t133, ptr %local.al.103
  %t134 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.17)
  %t135 = load i64, ptr %local.be.104
  %t136 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.18)
  %t137 = call i64 @"sx_f64_sub"(i64 %t135, i64 %t136)
  %t138 = load i64, ptr %local.lambda
  %t139 = call i64 @"sx_f64_mul"(i64 %t137, i64 %t138)
  %t140 = call i64 @"sx_f64_add"(i64 %t134, i64 %t139)
  store i64 %t140, ptr %local.be.104
  %t141 = load i64, ptr %local.rng.105
  %t142 = call i64 @"lcg_next"(i64 %t141)
  store i64 %t142, ptr %local.rng.105
  %t143 = load i64, ptr %local.rng.105
  %t144 = call i64 @"lcg_f64"(i64 %t143)
  %t145 = load i64, ptr %local.true_val.108
  %t146 = call i64 @"sx_f64_lt"(i64 %t144, i64 %t145)
  %t147 = icmp ne i64 %t146, 0
  br i1 %t147, label %then8, label %else8
then8:
  %t148 = load i64, ptr %local.al.103
  %t149 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.19)
  %t150 = call i64 @"sx_f64_add"(i64 %t148, i64 %t149)
  store i64 %t150, ptr %local.al.103
  br label %then8_end
then8_end:
  br label %endif8
else8:
  %t151 = load i64, ptr %local.be.104
  %t152 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.20)
  %t153 = call i64 @"sx_f64_add"(i64 %t151, i64 %t152)
  store i64 %t153, ptr %local.be.104
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t154 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  %t155 = load i64, ptr %local.al.103
  %t156 = load i64, ptr %local.be.104
  %t157 = call i64 @"beta_mean"(i64 %t155, i64 %t156)
  %t158 = load i64, ptr %local.true_val.108
  %t159 = call i64 @"sx_f64_sub"(i64 %t157, i64 %t158)
  store i64 %t159, ptr %local.err.109
  %t160 = load i64, ptr %local.total_err.107
  %t161 = load i64, ptr %local.err.109
  %t162 = load i64, ptr %local.err.109
  %t163 = call i64 @"sx_f64_mul"(i64 %t161, i64 %t162)
  %t164 = call i64 @"sx_f64_add"(i64 %t160, i64 %t163)
  store i64 %t164, ptr %local.total_err.107
  %t165 = load i64, ptr %local.step.106
  %t166 = add i64 %t165, 1
  store i64 %t166, ptr %local.step.106
  br label %loop6
endloop6:
  %t167 = load i64, ptr %local.total_err.107
  %t168 = load i64, ptr %local.obs
  %t169 = call i64 @"sx_int_to_f64"(i64 %t168)
  %t170 = call i64 @"sx_f64_div"(i64 %t167, i64 %t169)
  ret i64 %t170
}

define i64 @"avg_stationary"(i64 %lambda, i64 %true_val, i64 %obs) nounwind {
entry:
  %local.l1.171 = alloca i64
  %local.l2.172 = alloca i64
  %local.l3.173 = alloca i64
  %local.l4.174 = alloca i64
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t175 = load i64, ptr %local.lambda
  %t176 = load i64, ptr %local.true_val
  %t177 = load i64, ptr %local.obs
  %t178 = call i64 @"train_stationary"(i64 %t175, i64 %t176, i64 %t177, i64 42)
  store i64 %t178, ptr %local.l1.171
  %t179 = load i64, ptr %local.lambda
  %t180 = load i64, ptr %local.true_val
  %t181 = load i64, ptr %local.obs
  %t182 = call i64 @"train_stationary"(i64 %t179, i64 %t180, i64 %t181, i64 137)
  store i64 %t182, ptr %local.l2.172
  %t183 = load i64, ptr %local.lambda
  %t184 = load i64, ptr %local.true_val
  %t185 = load i64, ptr %local.obs
  %t186 = call i64 @"train_stationary"(i64 %t183, i64 %t184, i64 %t185, i64 999)
  store i64 %t186, ptr %local.l3.173
  %t187 = load i64, ptr %local.lambda
  %t188 = load i64, ptr %local.true_val
  %t189 = load i64, ptr %local.obs
  %t190 = call i64 @"train_stationary"(i64 %t187, i64 %t188, i64 %t189, i64 2023)
  store i64 %t190, ptr %local.l4.174
  %t191 = load i64, ptr %local.l1.171
  %t192 = load i64, ptr %local.l2.172
  %t193 = call i64 @"sx_f64_add"(i64 %t191, i64 %t192)
  %t194 = load i64, ptr %local.l3.173
  %t195 = call i64 @"sx_f64_add"(i64 %t193, i64 %t194)
  %t196 = load i64, ptr %local.l4.174
  %t197 = call i64 @"sx_f64_add"(i64 %t195, i64 %t196)
  %t198 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.21)
  %t199 = call i64 @"sx_f64_div"(i64 %t197, i64 %t198)
  ret i64 %t199
}

define i64 @"avg_changing"(i64 %lambda, i64 %v1, i64 %v2, i64 %sw, i64 %obs) nounwind {
entry:
  %local.l1.200 = alloca i64
  %local.l2.201 = alloca i64
  %local.l3.202 = alloca i64
  %local.l4.203 = alloca i64
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.v1 = alloca i64
  store i64 %v1, ptr %local.v1
  %local.v2 = alloca i64
  store i64 %v2, ptr %local.v2
  %local.sw = alloca i64
  store i64 %sw, ptr %local.sw
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t204 = load i64, ptr %local.lambda
  %t205 = load i64, ptr %local.v1
  %t206 = load i64, ptr %local.v2
  %t207 = load i64, ptr %local.sw
  %t208 = load i64, ptr %local.obs
  %t209 = call i64 @"train_changing"(i64 %t204, i64 %t205, i64 %t206, i64 %t207, i64 %t208, i64 42)
  store i64 %t209, ptr %local.l1.200
  %t210 = load i64, ptr %local.lambda
  %t211 = load i64, ptr %local.v1
  %t212 = load i64, ptr %local.v2
  %t213 = load i64, ptr %local.sw
  %t214 = load i64, ptr %local.obs
  %t215 = call i64 @"train_changing"(i64 %t210, i64 %t211, i64 %t212, i64 %t213, i64 %t214, i64 137)
  store i64 %t215, ptr %local.l2.201
  %t216 = load i64, ptr %local.lambda
  %t217 = load i64, ptr %local.v1
  %t218 = load i64, ptr %local.v2
  %t219 = load i64, ptr %local.sw
  %t220 = load i64, ptr %local.obs
  %t221 = call i64 @"train_changing"(i64 %t216, i64 %t217, i64 %t218, i64 %t219, i64 %t220, i64 999)
  store i64 %t221, ptr %local.l3.202
  %t222 = load i64, ptr %local.lambda
  %t223 = load i64, ptr %local.v1
  %t224 = load i64, ptr %local.v2
  %t225 = load i64, ptr %local.sw
  %t226 = load i64, ptr %local.obs
  %t227 = call i64 @"train_changing"(i64 %t222, i64 %t223, i64 %t224, i64 %t225, i64 %t226, i64 2023)
  store i64 %t227, ptr %local.l4.203
  %t228 = load i64, ptr %local.l1.200
  %t229 = load i64, ptr %local.l2.201
  %t230 = call i64 @"sx_f64_add"(i64 %t228, i64 %t229)
  %t231 = load i64, ptr %local.l3.202
  %t232 = call i64 @"sx_f64_add"(i64 %t230, i64 %t231)
  %t233 = load i64, ptr %local.l4.203
  %t234 = call i64 @"sx_f64_add"(i64 %t232, i64 %t233)
  %t235 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.22)
  %t236 = call i64 @"sx_f64_div"(i64 %t234, i64 %t235)
  ret i64 %t236
}

define i64 @"mg_lambda_stat"(i64 %lambda, i64 %true_val, i64 %obs) nounwind {
entry:
  %local.h.237 = alloca i64
  %local.lp.238 = alloca i64
  %local.lm.239 = alloca i64
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t240 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.23)
  store i64 %t240, ptr %local.h.237
  %t241 = load i64, ptr %local.lambda
  %t242 = load i64, ptr %local.h.237
  %t243 = call i64 @"sx_f64_add"(i64 %t241, i64 %t242)
  %t244 = load i64, ptr %local.true_val
  %t245 = load i64, ptr %local.obs
  %t246 = call i64 @"avg_stationary"(i64 %t243, i64 %t244, i64 %t245)
  store i64 %t246, ptr %local.lp.238
  %t247 = load i64, ptr %local.lambda
  %t248 = load i64, ptr %local.h.237
  %t249 = call i64 @"sx_f64_sub"(i64 %t247, i64 %t248)
  %t250 = load i64, ptr %local.true_val
  %t251 = load i64, ptr %local.obs
  %t252 = call i64 @"avg_stationary"(i64 %t249, i64 %t250, i64 %t251)
  store i64 %t252, ptr %local.lm.239
  %t253 = load i64, ptr %local.lp.238
  %t254 = load i64, ptr %local.lm.239
  %t255 = call i64 @"sx_f64_sub"(i64 %t253, i64 %t254)
  %t256 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.24)
  %t257 = load i64, ptr %local.h.237
  %t258 = call i64 @"sx_f64_mul"(i64 %t256, i64 %t257)
  %t259 = call i64 @"sx_f64_div"(i64 %t255, i64 %t258)
  ret i64 %t259
}

define i64 @"mg_lambda_chg"(i64 %lambda, i64 %v1, i64 %v2, i64 %sw, i64 %obs) nounwind {
entry:
  %local.h.260 = alloca i64
  %local.lp.261 = alloca i64
  %local.lm.262 = alloca i64
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.v1 = alloca i64
  store i64 %v1, ptr %local.v1
  %local.v2 = alloca i64
  store i64 %v2, ptr %local.v2
  %local.sw = alloca i64
  store i64 %sw, ptr %local.sw
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t263 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.25)
  store i64 %t263, ptr %local.h.260
  %t264 = load i64, ptr %local.lambda
  %t265 = load i64, ptr %local.h.260
  %t266 = call i64 @"sx_f64_add"(i64 %t264, i64 %t265)
  %t267 = load i64, ptr %local.v1
  %t268 = load i64, ptr %local.v2
  %t269 = load i64, ptr %local.sw
  %t270 = load i64, ptr %local.obs
  %t271 = call i64 @"avg_changing"(i64 %t266, i64 %t267, i64 %t268, i64 %t269, i64 %t270)
  store i64 %t271, ptr %local.lp.261
  %t272 = load i64, ptr %local.lambda
  %t273 = load i64, ptr %local.h.260
  %t274 = call i64 @"sx_f64_sub"(i64 %t272, i64 %t273)
  %t275 = load i64, ptr %local.v1
  %t276 = load i64, ptr %local.v2
  %t277 = load i64, ptr %local.sw
  %t278 = load i64, ptr %local.obs
  %t279 = call i64 @"avg_changing"(i64 %t274, i64 %t275, i64 %t276, i64 %t277, i64 %t278)
  store i64 %t279, ptr %local.lm.262
  %t280 = load i64, ptr %local.lp.261
  %t281 = load i64, ptr %local.lm.262
  %t282 = call i64 @"sx_f64_sub"(i64 %t280, i64 %t281)
  %t283 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.26)
  %t284 = load i64, ptr %local.h.260
  %t285 = call i64 @"sx_f64_mul"(i64 %t283, i64 %t284)
  %t286 = call i64 @"sx_f64_div"(i64 %t282, i64 %t285)
  ret i64 %t286
}

define i64 @"run_exp1"() nounwind {
entry:
  %local.obs.287 = alloca i64
  %local.best_stat_lam.288 = alloca i64
  %local.best_stat_err.289 = alloca i64
  %local.li.290 = alloca i64
  %local.lambda.291 = alloca i64
  %local.mse.292 = alloca i64
  %local.best_chg_lam.293 = alloca i64
  %local.best_chg_err.294 = alloca i64
  %local.lambda.295 = alloca i64
  %local.mse.296 = alloca i64
  %local.lam_stat.297 = alloca i64
  %local.lam_chg.298 = alloca i64
  %local.mg.299 = alloca i64
  %local.cycle.300 = alloca i64
  %t301 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.27)
  %t302 = ptrtoint ptr %t301 to i64
  %t303 = inttoptr i64 %t302 to ptr
  call void @intrinsic_println(ptr %t303)
  %t304 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.28)
  %t305 = ptrtoint ptr %t304 to i64
  %t306 = inttoptr i64 %t305 to ptr
  call void @intrinsic_println(ptr %t306)
  %t307 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.29)
  %t308 = ptrtoint ptr %t307 to i64
  %t309 = inttoptr i64 %t308 to ptr
  call void @intrinsic_println(ptr %t309)
  %t310 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.30)
  %t311 = ptrtoint ptr %t310 to i64
  %t312 = inttoptr i64 %t311 to ptr
  call void @intrinsic_println(ptr %t312)
  store i64 200, ptr %local.obs.287
  %t313 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.31)
  %t314 = ptrtoint ptr %t313 to i64
  %t315 = inttoptr i64 %t314 to ptr
  call void @intrinsic_println(ptr %t315)
  %t316 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.32)
  %t317 = ptrtoint ptr %t316 to i64
  %t318 = inttoptr i64 %t317 to ptr
  call void @intrinsic_println(ptr %t318)
  %t319 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.33)
  store i64 %t319, ptr %local.best_stat_lam.288
  %t320 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.34)
  store i64 %t320, ptr %local.best_stat_err.289
  store i64 0, ptr %local.li.290
  br label %loop9
loop9:
  %t321 = load i64, ptr %local.li.290
  %t322 = icmp sle i64 %t321, 10
  %t323 = zext i1 %t322 to i64
  %t324 = icmp ne i64 %t323, 0
  br i1 %t324, label %body9, label %endloop9
body9:
  %t325 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.35)
  %t326 = load i64, ptr %local.li.290
  %t327 = call i64 @"sx_int_to_f64"(i64 %t326)
  %t328 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.36)
  %t329 = call i64 @"sx_f64_mul"(i64 %t327, i64 %t328)
  %t330 = call i64 @"sx_f64_add"(i64 %t325, i64 %t329)
  store i64 %t330, ptr %local.lambda.291
  %t331 = load i64, ptr %local.lambda.291
  %t332 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.37)
  %t333 = load i64, ptr %local.obs.287
  %t334 = call i64 @"avg_stationary"(i64 %t331, i64 %t332, i64 %t333)
  store i64 %t334, ptr %local.mse.292
  %t335 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.38)
  %t336 = ptrtoint ptr %t335 to i64
  %t337 = inttoptr i64 %t336 to ptr
  call void @intrinsic_print(ptr %t337)
  %t338 = load i64, ptr %local.lambda.291
  %t339 = call i64 @"print_f64"(i64 %t338)
  %t340 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.39)
  %t341 = ptrtoint ptr %t340 to i64
  %t342 = inttoptr i64 %t341 to ptr
  call void @intrinsic_print(ptr %t342)
  %t343 = load i64, ptr %local.mse.292
  %t344 = call i64 @"print_f64"(i64 %t343)
  %t345 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.40)
  %t346 = ptrtoint ptr %t345 to i64
  %t347 = inttoptr i64 %t346 to ptr
  call void @intrinsic_println(ptr %t347)
  %t348 = load i64, ptr %local.mse.292
  %t349 = load i64, ptr %local.best_stat_err.289
  %t350 = call i64 @"sx_f64_lt"(i64 %t348, i64 %t349)
  %t351 = icmp ne i64 %t350, 0
  br i1 %t351, label %then10, label %else10
then10:
  %t352 = load i64, ptr %local.mse.292
  store i64 %t352, ptr %local.best_stat_err.289
  %t353 = load i64, ptr %local.lambda.291
  store i64 %t353, ptr %local.best_stat_lam.288
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t354 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t355 = load i64, ptr %local.li.290
  %t356 = add i64 %t355, 1
  store i64 %t356, ptr %local.li.290
  br label %loop9
endloop9:
  %t357 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.41)
  %t358 = ptrtoint ptr %t357 to i64
  %t359 = inttoptr i64 %t358 to ptr
  call void @intrinsic_print(ptr %t359)
  %t360 = load i64, ptr %local.best_stat_lam.288
  %t361 = call i64 @"print_f64"(i64 %t360)
  %t362 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.42)
  %t363 = ptrtoint ptr %t362 to i64
  %t364 = inttoptr i64 %t363 to ptr
  call void @intrinsic_print(ptr %t364)
  %t365 = load i64, ptr %local.best_stat_err.289
  %t366 = call i64 @"print_f64"(i64 %t365)
  %t367 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.43)
  %t368 = ptrtoint ptr %t367 to i64
  %t369 = inttoptr i64 %t368 to ptr
  call void @intrinsic_println(ptr %t369)
  %t370 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.44)
  %t371 = ptrtoint ptr %t370 to i64
  %t372 = inttoptr i64 %t371 to ptr
  call void @intrinsic_println(ptr %t372)
  %t373 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.45)
  %t374 = ptrtoint ptr %t373 to i64
  %t375 = inttoptr i64 %t374 to ptr
  call void @intrinsic_println(ptr %t375)
  %t376 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.46)
  %t377 = ptrtoint ptr %t376 to i64
  %t378 = inttoptr i64 %t377 to ptr
  call void @intrinsic_println(ptr %t378)
  %t379 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.47)
  store i64 %t379, ptr %local.best_chg_lam.293
  %t380 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.48)
  store i64 %t380, ptr %local.best_chg_err.294
  store i64 0, ptr %local.li.290
  br label %loop11
loop11:
  %t381 = load i64, ptr %local.li.290
  %t382 = icmp sle i64 %t381, 10
  %t383 = zext i1 %t382 to i64
  %t384 = icmp ne i64 %t383, 0
  br i1 %t384, label %body11, label %endloop11
body11:
  %t385 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.49)
  %t386 = load i64, ptr %local.li.290
  %t387 = call i64 @"sx_int_to_f64"(i64 %t386)
  %t388 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.50)
  %t389 = call i64 @"sx_f64_mul"(i64 %t387, i64 %t388)
  %t390 = call i64 @"sx_f64_add"(i64 %t385, i64 %t389)
  store i64 %t390, ptr %local.lambda.295
  %t391 = load i64, ptr %local.lambda.295
  %t392 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.51)
  %t393 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.52)
  %t394 = load i64, ptr %local.obs.287
  %t395 = call i64 @"avg_changing"(i64 %t391, i64 %t392, i64 %t393, i64 100, i64 %t394)
  store i64 %t395, ptr %local.mse.296
  %t396 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.53)
  %t397 = ptrtoint ptr %t396 to i64
  %t398 = inttoptr i64 %t397 to ptr
  call void @intrinsic_print(ptr %t398)
  %t399 = load i64, ptr %local.lambda.295
  %t400 = call i64 @"print_f64"(i64 %t399)
  %t401 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.54)
  %t402 = ptrtoint ptr %t401 to i64
  %t403 = inttoptr i64 %t402 to ptr
  call void @intrinsic_print(ptr %t403)
  %t404 = load i64, ptr %local.mse.296
  %t405 = call i64 @"print_f64"(i64 %t404)
  %t406 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.55)
  %t407 = ptrtoint ptr %t406 to i64
  %t408 = inttoptr i64 %t407 to ptr
  call void @intrinsic_println(ptr %t408)
  %t409 = load i64, ptr %local.mse.296
  %t410 = load i64, ptr %local.best_chg_err.294
  %t411 = call i64 @"sx_f64_lt"(i64 %t409, i64 %t410)
  %t412 = icmp ne i64 %t411, 0
  br i1 %t412, label %then12, label %else12
then12:
  %t413 = load i64, ptr %local.mse.296
  store i64 %t413, ptr %local.best_chg_err.294
  %t414 = load i64, ptr %local.lambda.295
  store i64 %t414, ptr %local.best_chg_lam.293
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t415 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t416 = load i64, ptr %local.li.290
  %t417 = add i64 %t416, 1
  store i64 %t417, ptr %local.li.290
  br label %loop11
endloop11:
  %t418 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.56)
  %t419 = ptrtoint ptr %t418 to i64
  %t420 = inttoptr i64 %t419 to ptr
  call void @intrinsic_print(ptr %t420)
  %t421 = load i64, ptr %local.best_chg_lam.293
  %t422 = call i64 @"print_f64"(i64 %t421)
  %t423 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.57)
  %t424 = ptrtoint ptr %t423 to i64
  %t425 = inttoptr i64 %t424 to ptr
  call void @intrinsic_print(ptr %t425)
  %t426 = load i64, ptr %local.best_chg_err.294
  %t427 = call i64 @"print_f64"(i64 %t426)
  %t428 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.58)
  %t429 = ptrtoint ptr %t428 to i64
  %t430 = inttoptr i64 %t429 to ptr
  call void @intrinsic_println(ptr %t430)
  %t431 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.59)
  %t432 = ptrtoint ptr %t431 to i64
  %t433 = inttoptr i64 %t432 to ptr
  call void @intrinsic_println(ptr %t433)
  %t434 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.60)
  %t435 = ptrtoint ptr %t434 to i64
  %t436 = inttoptr i64 %t435 to ptr
  call void @intrinsic_println(ptr %t436)
  %t437 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.61)
  store i64 %t437, ptr %local.lam_stat.297
  %t438 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.62)
  store i64 %t438, ptr %local.lam_chg.298
  %t439 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.63)
  store i64 %t439, ptr %local.mg.299
  store i64 0, ptr %local.cycle.300
  br label %loop13
loop13:
  %t440 = load i64, ptr %local.cycle.300
  %t441 = icmp slt i64 %t440, 30
  %t442 = zext i1 %t441 to i64
  %t443 = icmp ne i64 %t442, 0
  br i1 %t443, label %body13, label %endloop13
body13:
  %t444 = load i64, ptr %local.lam_stat.297
  %t445 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.64)
  %t446 = load i64, ptr %local.obs.287
  %t447 = call i64 @"mg_lambda_stat"(i64 %t444, i64 %t445, i64 %t446)
  store i64 %t447, ptr %local.mg.299
  %t448 = load i64, ptr %local.lam_stat.297
  %t449 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.65)
  %t450 = load i64, ptr %local.mg.299
  %t451 = call i64 @"sx_f64_mul"(i64 %t449, i64 %t450)
  %t452 = call i64 @"sx_f64_sub"(i64 %t448, i64 %t451)
  %t453 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.66)
  %t454 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.67)
  %t455 = call i64 @"clamp"(i64 %t452, i64 %t453, i64 %t454)
  store i64 %t455, ptr %local.lam_stat.297
  %t456 = load i64, ptr %local.lam_chg.298
  %t457 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.68)
  %t458 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.69)
  %t459 = load i64, ptr %local.obs.287
  %t460 = call i64 @"mg_lambda_chg"(i64 %t456, i64 %t457, i64 %t458, i64 100, i64 %t459)
  store i64 %t460, ptr %local.mg.299
  %t461 = load i64, ptr %local.lam_chg.298
  %t462 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.70)
  %t463 = load i64, ptr %local.mg.299
  %t464 = call i64 @"sx_f64_mul"(i64 %t462, i64 %t463)
  %t465 = call i64 @"sx_f64_sub"(i64 %t461, i64 %t464)
  %t466 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.71)
  %t467 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.72)
  %t468 = call i64 @"clamp"(i64 %t465, i64 %t466, i64 %t467)
  store i64 %t468, ptr %local.lam_chg.298
  %t469 = load i64, ptr %local.cycle.300
  %t470 = add i64 %t469, 1
  store i64 %t470, ptr %local.cycle.300
  br label %loop13
endloop13:
  %t471 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.73)
  %t472 = ptrtoint ptr %t471 to i64
  %t473 = inttoptr i64 %t472 to ptr
  call void @intrinsic_print(ptr %t473)
  %t474 = load i64, ptr %local.lam_stat.297
  %t475 = call i64 @"print_f64"(i64 %t474)
  %t476 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.74)
  %t477 = ptrtoint ptr %t476 to i64
  %t478 = inttoptr i64 %t477 to ptr
  call void @intrinsic_println(ptr %t478)
  %t479 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.75)
  %t480 = ptrtoint ptr %t479 to i64
  %t481 = inttoptr i64 %t480 to ptr
  call void @intrinsic_print(ptr %t481)
  %t482 = load i64, ptr %local.lam_chg.298
  %t483 = call i64 @"print_f64"(i64 %t482)
  %t484 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.76)
  %t485 = ptrtoint ptr %t484 to i64
  %t486 = inttoptr i64 %t485 to ptr
  call void @intrinsic_println(ptr %t486)
  %t487 = load i64, ptr %local.lam_stat.297
  %t488 = load i64, ptr %local.lam_chg.298
  %t489 = call i64 @"sx_f64_gt"(i64 %t487, i64 %t488)
  %t490 = icmp ne i64 %t489, 0
  br i1 %t490, label %then14, label %else14
then14:
  %t491 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.77)
  %t492 = ptrtoint ptr %t491 to i64
  %t493 = inttoptr i64 %t492 to ptr
  call void @intrinsic_println(ptr %t493)
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t494 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t495 = load i64, ptr %local.lam_chg.298
  %t496 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.78)
  %t497 = call i64 @"sx_f64_lt"(i64 %t495, i64 %t496)
  %t498 = icmp ne i64 %t497, 0
  br i1 %t498, label %then15, label %else15
then15:
  %t499 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.79)
  %t500 = ptrtoint ptr %t499 to i64
  %t501 = inttoptr i64 %t500 to ptr
  call void @intrinsic_println(ptr %t501)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t502 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t503 = load i64, ptr %local.lam_stat.297
  %t504 = load i64, ptr %local.best_stat_lam.288
  %t505 = call i64 @"sx_f64_sub"(i64 %t503, i64 %t504)
  %t506 = call i64 @"abs_f64"(i64 %t505)
  %t507 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.80)
  %t508 = call i64 @"sx_f64_lt"(i64 %t506, i64 %t507)
  %t509 = icmp ne i64 %t508, 0
  br i1 %t509, label %then16, label %else16
then16:
  %t510 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.81)
  %t511 = ptrtoint ptr %t510 to i64
  %t512 = inttoptr i64 %t511 to ptr
  call void @intrinsic_println(ptr %t512)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t513 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t514 = load i64, ptr %local.lam_chg.298
  %t515 = load i64, ptr %local.best_chg_lam.293
  %t516 = call i64 @"sx_f64_sub"(i64 %t514, i64 %t515)
  %t517 = call i64 @"abs_f64"(i64 %t516)
  %t518 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.82)
  %t519 = call i64 @"sx_f64_lt"(i64 %t517, i64 %t518)
  %t520 = icmp ne i64 %t519, 0
  br i1 %t520, label %then17, label %else17
then17:
  %t521 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.83)
  %t522 = ptrtoint ptr %t521 to i64
  %t523 = inttoptr i64 %t522 to ptr
  call void @intrinsic_println(ptr %t523)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t524 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t525 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.84)
  %t526 = ptrtoint ptr %t525 to i64
  %t527 = inttoptr i64 %t526 to ptr
  call void @intrinsic_println(ptr %t527)
  ret i64 0
}

define i64 @"learn_domain"(i64 %true_val, i64 %obs, i64 %init_al, i64 %init_be, i64 %seed) nounwind {
entry:
  %local.al.528 = alloca i64
  %local.be.529 = alloca i64
  %local.rng.530 = alloca i64
  %local.step.531 = alloca i64
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.init_al = alloca i64
  store i64 %init_al, ptr %local.init_al
  %local.init_be = alloca i64
  store i64 %init_be, ptr %local.init_be
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t532 = load i64, ptr %local.init_al
  store i64 %t532, ptr %local.al.528
  %t533 = load i64, ptr %local.init_be
  store i64 %t533, ptr %local.be.529
  %t534 = load i64, ptr %local.seed
  store i64 %t534, ptr %local.rng.530
  store i64 0, ptr %local.step.531
  br label %loop18
loop18:
  %t535 = load i64, ptr %local.step.531
  %t536 = load i64, ptr %local.obs
  %t537 = icmp slt i64 %t535, %t536
  %t538 = zext i1 %t537 to i64
  %t539 = icmp ne i64 %t538, 0
  br i1 %t539, label %body18, label %endloop18
body18:
  %t540 = load i64, ptr %local.rng.530
  %t541 = call i64 @"lcg_next"(i64 %t540)
  store i64 %t541, ptr %local.rng.530
  %t542 = load i64, ptr %local.rng.530
  %t543 = call i64 @"lcg_f64"(i64 %t542)
  %t544 = load i64, ptr %local.true_val
  %t545 = call i64 @"sx_f64_lt"(i64 %t543, i64 %t544)
  %t546 = icmp ne i64 %t545, 0
  br i1 %t546, label %then19, label %else19
then19:
  %t547 = load i64, ptr %local.al.528
  %t548 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.85)
  %t549 = call i64 @"sx_f64_add"(i64 %t547, i64 %t548)
  store i64 %t549, ptr %local.al.528
  br label %then19_end
then19_end:
  br label %endif19
else19:
  %t550 = load i64, ptr %local.be.529
  %t551 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.86)
  %t552 = call i64 @"sx_f64_add"(i64 %t550, i64 %t551)
  store i64 %t552, ptr %local.be.529
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t553 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t554 = load i64, ptr %local.step.531
  %t555 = add i64 %t554, 1
  store i64 %t555, ptr %local.step.531
  br label %loop18
endloop18:
  %t556 = load i64, ptr %local.al.528
  %t557 = load i64, ptr %local.be.529
  %t558 = call i64 @"beta_mean"(i64 %t556, i64 %t557)
  ret i64 %t558
}

define i64 @"learn_domain_mse"(i64 %true_val, i64 %obs, i64 %init_al, i64 %init_be, i64 %seed) nounwind {
entry:
  %local.al.559 = alloca i64
  %local.be.560 = alloca i64
  %local.rng.561 = alloca i64
  %local.step.562 = alloca i64
  %local.total_err.563 = alloca i64
  %local.err.564 = alloca i64
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.init_al = alloca i64
  store i64 %init_al, ptr %local.init_al
  %local.init_be = alloca i64
  store i64 %init_be, ptr %local.init_be
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t565 = load i64, ptr %local.init_al
  store i64 %t565, ptr %local.al.559
  %t566 = load i64, ptr %local.init_be
  store i64 %t566, ptr %local.be.560
  %t567 = load i64, ptr %local.seed
  store i64 %t567, ptr %local.rng.561
  store i64 0, ptr %local.step.562
  %t568 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.87)
  store i64 %t568, ptr %local.total_err.563
  br label %loop20
loop20:
  %t569 = load i64, ptr %local.step.562
  %t570 = load i64, ptr %local.obs
  %t571 = icmp slt i64 %t569, %t570
  %t572 = zext i1 %t571 to i64
  %t573 = icmp ne i64 %t572, 0
  br i1 %t573, label %body20, label %endloop20
body20:
  %t574 = load i64, ptr %local.rng.561
  %t575 = call i64 @"lcg_next"(i64 %t574)
  store i64 %t575, ptr %local.rng.561
  %t576 = load i64, ptr %local.rng.561
  %t577 = call i64 @"lcg_f64"(i64 %t576)
  %t578 = load i64, ptr %local.true_val
  %t579 = call i64 @"sx_f64_lt"(i64 %t577, i64 %t578)
  %t580 = icmp ne i64 %t579, 0
  br i1 %t580, label %then21, label %else21
then21:
  %t581 = load i64, ptr %local.al.559
  %t582 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.88)
  %t583 = call i64 @"sx_f64_add"(i64 %t581, i64 %t582)
  store i64 %t583, ptr %local.al.559
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t584 = load i64, ptr %local.be.560
  %t585 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.89)
  %t586 = call i64 @"sx_f64_add"(i64 %t584, i64 %t585)
  store i64 %t586, ptr %local.be.560
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t587 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  %t588 = load i64, ptr %local.al.559
  %t589 = load i64, ptr %local.be.560
  %t590 = call i64 @"beta_mean"(i64 %t588, i64 %t589)
  %t591 = load i64, ptr %local.true_val
  %t592 = call i64 @"sx_f64_sub"(i64 %t590, i64 %t591)
  store i64 %t592, ptr %local.err.564
  %t593 = load i64, ptr %local.total_err.563
  %t594 = load i64, ptr %local.err.564
  %t595 = load i64, ptr %local.err.564
  %t596 = call i64 @"sx_f64_mul"(i64 %t594, i64 %t595)
  %t597 = call i64 @"sx_f64_add"(i64 %t593, i64 %t596)
  store i64 %t597, ptr %local.total_err.563
  %t598 = load i64, ptr %local.step.562
  %t599 = add i64 %t598, 1
  store i64 %t599, ptr %local.step.562
  br label %loop20
endloop20:
  %t600 = load i64, ptr %local.total_err.563
  %t601 = load i64, ptr %local.obs
  %t602 = call i64 @"sx_int_to_f64"(i64 %t601)
  %t603 = call i64 @"sx_f64_div"(i64 %t600, i64 %t602)
  ret i64 %t603
}

define i64 @"transfer_mse"(i64 %true_a, i64 %true_b, i64 %obs_a, i64 %obs_b, i64 %seed) nounwind {
entry:
  %local.al.604 = alloca i64
  %local.be.605 = alloca i64
  %local.rng.606 = alloca i64
  %local.step.607 = alloca i64
  %local.transfer_al.608 = alloca i64
  %local.transfer_be.609 = alloca i64
  %local.true_a = alloca i64
  store i64 %true_a, ptr %local.true_a
  %local.true_b = alloca i64
  store i64 %true_b, ptr %local.true_b
  %local.obs_a = alloca i64
  store i64 %obs_a, ptr %local.obs_a
  %local.obs_b = alloca i64
  store i64 %obs_b, ptr %local.obs_b
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t610 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.90)
  store i64 %t610, ptr %local.al.604
  %t611 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.91)
  store i64 %t611, ptr %local.be.605
  %t612 = load i64, ptr %local.seed
  store i64 %t612, ptr %local.rng.606
  store i64 0, ptr %local.step.607
  br label %loop22
loop22:
  %t613 = load i64, ptr %local.step.607
  %t614 = load i64, ptr %local.obs_a
  %t615 = icmp slt i64 %t613, %t614
  %t616 = zext i1 %t615 to i64
  %t617 = icmp ne i64 %t616, 0
  br i1 %t617, label %body22, label %endloop22
body22:
  %t618 = load i64, ptr %local.rng.606
  %t619 = call i64 @"lcg_next"(i64 %t618)
  store i64 %t619, ptr %local.rng.606
  %t620 = load i64, ptr %local.rng.606
  %t621 = call i64 @"lcg_f64"(i64 %t620)
  %t622 = load i64, ptr %local.true_a
  %t623 = call i64 @"sx_f64_lt"(i64 %t621, i64 %t622)
  %t624 = icmp ne i64 %t623, 0
  br i1 %t624, label %then23, label %else23
then23:
  %t625 = load i64, ptr %local.al.604
  %t626 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.92)
  %t627 = call i64 @"sx_f64_add"(i64 %t625, i64 %t626)
  store i64 %t627, ptr %local.al.604
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t628 = load i64, ptr %local.be.605
  %t629 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.93)
  %t630 = call i64 @"sx_f64_add"(i64 %t628, i64 %t629)
  store i64 %t630, ptr %local.be.605
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t631 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t632 = load i64, ptr %local.step.607
  %t633 = add i64 %t632, 1
  store i64 %t633, ptr %local.step.607
  br label %loop22
endloop22:
  %t634 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.94)
  %t635 = load i64, ptr %local.al.604
  %t636 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.95)
  %t637 = call i64 @"sx_f64_sub"(i64 %t635, i64 %t636)
  %t638 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.96)
  %t639 = call i64 @"sx_f64_mul"(i64 %t637, i64 %t638)
  %t640 = call i64 @"sx_f64_add"(i64 %t634, i64 %t639)
  store i64 %t640, ptr %local.transfer_al.608
  %t641 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.97)
  %t642 = load i64, ptr %local.be.605
  %t643 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.98)
  %t644 = call i64 @"sx_f64_sub"(i64 %t642, i64 %t643)
  %t645 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.99)
  %t646 = call i64 @"sx_f64_mul"(i64 %t644, i64 %t645)
  %t647 = call i64 @"sx_f64_add"(i64 %t641, i64 %t646)
  store i64 %t647, ptr %local.transfer_be.609
  %t648 = load i64, ptr %local.true_b
  %t649 = load i64, ptr %local.obs_b
  %t650 = load i64, ptr %local.transfer_al.608
  %t651 = load i64, ptr %local.transfer_be.609
  %t652 = load i64, ptr %local.rng.606
  %t653 = call i64 @"learn_domain_mse"(i64 %t648, i64 %t649, i64 %t650, i64 %t651, i64 %t652)
  ret i64 %t653
}

define i64 @"avg_fresh_mse"(i64 %true_b, i64 %obs_b) nounwind {
entry:
  %local.l1.654 = alloca i64
  %local.l2.655 = alloca i64
  %local.l3.656 = alloca i64
  %local.l4.657 = alloca i64
  %local.true_b = alloca i64
  store i64 %true_b, ptr %local.true_b
  %local.obs_b = alloca i64
  store i64 %obs_b, ptr %local.obs_b
  %t658 = load i64, ptr %local.true_b
  %t659 = load i64, ptr %local.obs_b
  %t660 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.100)
  %t661 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.101)
  %t662 = call i64 @"learn_domain_mse"(i64 %t658, i64 %t659, i64 %t660, i64 %t661, i64 42)
  store i64 %t662, ptr %local.l1.654
  %t663 = load i64, ptr %local.true_b
  %t664 = load i64, ptr %local.obs_b
  %t665 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.102)
  %t666 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.103)
  %t667 = call i64 @"learn_domain_mse"(i64 %t663, i64 %t664, i64 %t665, i64 %t666, i64 137)
  store i64 %t667, ptr %local.l2.655
  %t668 = load i64, ptr %local.true_b
  %t669 = load i64, ptr %local.obs_b
  %t670 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.104)
  %t671 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.105)
  %t672 = call i64 @"learn_domain_mse"(i64 %t668, i64 %t669, i64 %t670, i64 %t671, i64 999)
  store i64 %t672, ptr %local.l3.656
  %t673 = load i64, ptr %local.true_b
  %t674 = load i64, ptr %local.obs_b
  %t675 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.106)
  %t676 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.107)
  %t677 = call i64 @"learn_domain_mse"(i64 %t673, i64 %t674, i64 %t675, i64 %t676, i64 2023)
  store i64 %t677, ptr %local.l4.657
  %t678 = load i64, ptr %local.l1.654
  %t679 = load i64, ptr %local.l2.655
  %t680 = call i64 @"sx_f64_add"(i64 %t678, i64 %t679)
  %t681 = load i64, ptr %local.l3.656
  %t682 = call i64 @"sx_f64_add"(i64 %t680, i64 %t681)
  %t683 = load i64, ptr %local.l4.657
  %t684 = call i64 @"sx_f64_add"(i64 %t682, i64 %t683)
  %t685 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.108)
  %t686 = call i64 @"sx_f64_div"(i64 %t684, i64 %t685)
  ret i64 %t686
}

define i64 @"avg_transfer_mse"(i64 %true_a, i64 %true_b, i64 %obs_a, i64 %obs_b) nounwind {
entry:
  %local.l1.687 = alloca i64
  %local.l2.688 = alloca i64
  %local.l3.689 = alloca i64
  %local.l4.690 = alloca i64
  %local.true_a = alloca i64
  store i64 %true_a, ptr %local.true_a
  %local.true_b = alloca i64
  store i64 %true_b, ptr %local.true_b
  %local.obs_a = alloca i64
  store i64 %obs_a, ptr %local.obs_a
  %local.obs_b = alloca i64
  store i64 %obs_b, ptr %local.obs_b
  %t691 = load i64, ptr %local.true_a
  %t692 = load i64, ptr %local.true_b
  %t693 = load i64, ptr %local.obs_a
  %t694 = load i64, ptr %local.obs_b
  %t695 = call i64 @"transfer_mse"(i64 %t691, i64 %t692, i64 %t693, i64 %t694, i64 42)
  store i64 %t695, ptr %local.l1.687
  %t696 = load i64, ptr %local.true_a
  %t697 = load i64, ptr %local.true_b
  %t698 = load i64, ptr %local.obs_a
  %t699 = load i64, ptr %local.obs_b
  %t700 = call i64 @"transfer_mse"(i64 %t696, i64 %t697, i64 %t698, i64 %t699, i64 137)
  store i64 %t700, ptr %local.l2.688
  %t701 = load i64, ptr %local.true_a
  %t702 = load i64, ptr %local.true_b
  %t703 = load i64, ptr %local.obs_a
  %t704 = load i64, ptr %local.obs_b
  %t705 = call i64 @"transfer_mse"(i64 %t701, i64 %t702, i64 %t703, i64 %t704, i64 999)
  store i64 %t705, ptr %local.l3.689
  %t706 = load i64, ptr %local.true_a
  %t707 = load i64, ptr %local.true_b
  %t708 = load i64, ptr %local.obs_a
  %t709 = load i64, ptr %local.obs_b
  %t710 = call i64 @"transfer_mse"(i64 %t706, i64 %t707, i64 %t708, i64 %t709, i64 2023)
  store i64 %t710, ptr %local.l4.690
  %t711 = load i64, ptr %local.l1.687
  %t712 = load i64, ptr %local.l2.688
  %t713 = call i64 @"sx_f64_add"(i64 %t711, i64 %t712)
  %t714 = load i64, ptr %local.l3.689
  %t715 = call i64 @"sx_f64_add"(i64 %t713, i64 %t714)
  %t716 = load i64, ptr %local.l4.690
  %t717 = call i64 @"sx_f64_add"(i64 %t715, i64 %t716)
  %t718 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.109)
  %t719 = call i64 @"sx_f64_div"(i64 %t717, i64 %t718)
  ret i64 %t719
}

define i64 @"run_exp2"() nounwind {
entry:
  %local.true_a.720 = alloca i64
  %local.obs_a.721 = alloca i64
  %local.obs_b.722 = alloca i64
  %local.fresh.723 = alloca i64
  %local.trans.724 = alloca i64
  %t725 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.110)
  %t726 = ptrtoint ptr %t725 to i64
  %t727 = inttoptr i64 %t726 to ptr
  call void @intrinsic_println(ptr %t727)
  %t728 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.111)
  %t729 = ptrtoint ptr %t728 to i64
  %t730 = inttoptr i64 %t729 to ptr
  call void @intrinsic_println(ptr %t730)
  %t731 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.112)
  %t732 = ptrtoint ptr %t731 to i64
  %t733 = inttoptr i64 %t732 to ptr
  call void @intrinsic_println(ptr %t733)
  %t734 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.113)
  %t735 = ptrtoint ptr %t734 to i64
  %t736 = inttoptr i64 %t735 to ptr
  call void @intrinsic_println(ptr %t736)
  %t737 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.114)
  store i64 %t737, ptr %local.true_a.720
  store i64 100, ptr %local.obs_a.721
  store i64 60, ptr %local.obs_b.722
  %t738 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.115)
  %t739 = ptrtoint ptr %t738 to i64
  %t740 = inttoptr i64 %t739 to ptr
  call void @intrinsic_println(ptr %t740)
  %t741 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.116)
  %t742 = ptrtoint ptr %t741 to i64
  %t743 = inttoptr i64 %t742 to ptr
  call void @intrinsic_println(ptr %t743)
  %t744 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.117)
  %t745 = ptrtoint ptr %t744 to i64
  %t746 = inttoptr i64 %t745 to ptr
  call void @intrinsic_println(ptr %t746)
  %t747 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.118)
  %t748 = ptrtoint ptr %t747 to i64
  %t749 = inttoptr i64 %t748 to ptr
  call void @intrinsic_println(ptr %t749)
  %t750 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.119)
  %t751 = load i64, ptr %local.obs_b.722
  %t752 = call i64 @"avg_fresh_mse"(i64 %t750, i64 %t751)
  store i64 %t752, ptr %local.fresh.723
  %t753 = load i64, ptr %local.true_a.720
  %t754 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.120)
  %t755 = load i64, ptr %local.obs_a.721
  %t756 = load i64, ptr %local.obs_b.722
  %t757 = call i64 @"avg_transfer_mse"(i64 %t753, i64 %t754, i64 %t755, i64 %t756)
  store i64 %t757, ptr %local.trans.724
  %t758 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.121)
  %t759 = ptrtoint ptr %t758 to i64
  %t760 = inttoptr i64 %t759 to ptr
  call void @intrinsic_print(ptr %t760)
  %t761 = load i64, ptr %local.fresh.723
  %t762 = call i64 @"print_f64"(i64 %t761)
  %t763 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.122)
  %t764 = ptrtoint ptr %t763 to i64
  %t765 = inttoptr i64 %t764 to ptr
  call void @intrinsic_print(ptr %t765)
  %t766 = load i64, ptr %local.trans.724
  %t767 = call i64 @"print_f64"(i64 %t766)
  %t768 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.123)
  %t769 = ptrtoint ptr %t768 to i64
  %t770 = inttoptr i64 %t769 to ptr
  call void @intrinsic_print(ptr %t770)
  %t771 = load i64, ptr %local.trans.724
  %t772 = load i64, ptr %local.fresh.723
  %t773 = call i64 @"sx_f64_lt"(i64 %t771, i64 %t772)
  %t774 = icmp ne i64 %t773, 0
  br i1 %t774, label %then24, label %else24
then24:
  %t775 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.124)
  %t776 = ptrtoint ptr %t775 to i64
  %t777 = inttoptr i64 %t776 to ptr
  call void @intrinsic_print(ptr %t777)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  %t778 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.125)
  %t779 = ptrtoint ptr %t778 to i64
  %t780 = inttoptr i64 %t779 to ptr
  call void @intrinsic_print(ptr %t780)
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t781 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t782 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.126)
  %t783 = ptrtoint ptr %t782 to i64
  %t784 = inttoptr i64 %t783 to ptr
  call void @intrinsic_println(ptr %t784)
  %t785 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.127)
  %t786 = load i64, ptr %local.obs_b.722
  %t787 = call i64 @"avg_fresh_mse"(i64 %t785, i64 %t786)
  store i64 %t787, ptr %local.fresh.723
  %t788 = load i64, ptr %local.true_a.720
  %t789 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.128)
  %t790 = load i64, ptr %local.obs_a.721
  %t791 = load i64, ptr %local.obs_b.722
  %t792 = call i64 @"avg_transfer_mse"(i64 %t788, i64 %t789, i64 %t790, i64 %t791)
  store i64 %t792, ptr %local.trans.724
  %t793 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.129)
  %t794 = ptrtoint ptr %t793 to i64
  %t795 = inttoptr i64 %t794 to ptr
  call void @intrinsic_print(ptr %t795)
  %t796 = load i64, ptr %local.fresh.723
  %t797 = call i64 @"print_f64"(i64 %t796)
  %t798 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.130)
  %t799 = ptrtoint ptr %t798 to i64
  %t800 = inttoptr i64 %t799 to ptr
  call void @intrinsic_print(ptr %t800)
  %t801 = load i64, ptr %local.trans.724
  %t802 = call i64 @"print_f64"(i64 %t801)
  %t803 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.131)
  %t804 = ptrtoint ptr %t803 to i64
  %t805 = inttoptr i64 %t804 to ptr
  call void @intrinsic_print(ptr %t805)
  %t806 = load i64, ptr %local.trans.724
  %t807 = load i64, ptr %local.fresh.723
  %t808 = call i64 @"sx_f64_lt"(i64 %t806, i64 %t807)
  %t809 = icmp ne i64 %t808, 0
  br i1 %t809, label %then25, label %else25
then25:
  %t810 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.132)
  %t811 = ptrtoint ptr %t810 to i64
  %t812 = inttoptr i64 %t811 to ptr
  call void @intrinsic_print(ptr %t812)
  br label %then25_end
then25_end:
  br label %endif25
else25:
  %t813 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.133)
  %t814 = ptrtoint ptr %t813 to i64
  %t815 = inttoptr i64 %t814 to ptr
  call void @intrinsic_print(ptr %t815)
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t816 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t817 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.134)
  %t818 = ptrtoint ptr %t817 to i64
  %t819 = inttoptr i64 %t818 to ptr
  call void @intrinsic_println(ptr %t819)
  %t820 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.135)
  %t821 = load i64, ptr %local.obs_b.722
  %t822 = call i64 @"avg_fresh_mse"(i64 %t820, i64 %t821)
  store i64 %t822, ptr %local.fresh.723
  %t823 = load i64, ptr %local.true_a.720
  %t824 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.136)
  %t825 = load i64, ptr %local.obs_a.721
  %t826 = load i64, ptr %local.obs_b.722
  %t827 = call i64 @"avg_transfer_mse"(i64 %t823, i64 %t824, i64 %t825, i64 %t826)
  store i64 %t827, ptr %local.trans.724
  %t828 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.137)
  %t829 = ptrtoint ptr %t828 to i64
  %t830 = inttoptr i64 %t829 to ptr
  call void @intrinsic_print(ptr %t830)
  %t831 = load i64, ptr %local.fresh.723
  %t832 = call i64 @"print_f64"(i64 %t831)
  %t833 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.138)
  %t834 = ptrtoint ptr %t833 to i64
  %t835 = inttoptr i64 %t834 to ptr
  call void @intrinsic_print(ptr %t835)
  %t836 = load i64, ptr %local.trans.724
  %t837 = call i64 @"print_f64"(i64 %t836)
  %t838 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.139)
  %t839 = ptrtoint ptr %t838 to i64
  %t840 = inttoptr i64 %t839 to ptr
  call void @intrinsic_print(ptr %t840)
  %t841 = load i64, ptr %local.trans.724
  %t842 = load i64, ptr %local.fresh.723
  %t843 = call i64 @"sx_f64_lt"(i64 %t841, i64 %t842)
  %t844 = icmp ne i64 %t843, 0
  br i1 %t844, label %then26, label %else26
then26:
  %t845 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.140)
  %t846 = ptrtoint ptr %t845 to i64
  %t847 = inttoptr i64 %t846 to ptr
  call void @intrinsic_print(ptr %t847)
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t848 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.141)
  %t849 = ptrtoint ptr %t848 to i64
  %t850 = inttoptr i64 %t849 to ptr
  call void @intrinsic_print(ptr %t850)
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t851 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t852 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.142)
  %t853 = ptrtoint ptr %t852 to i64
  %t854 = inttoptr i64 %t853 to ptr
  call void @intrinsic_println(ptr %t854)
  %t855 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.143)
  %t856 = load i64, ptr %local.obs_b.722
  %t857 = call i64 @"avg_fresh_mse"(i64 %t855, i64 %t856)
  store i64 %t857, ptr %local.fresh.723
  %t858 = load i64, ptr %local.true_a.720
  %t859 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.144)
  %t860 = load i64, ptr %local.obs_a.721
  %t861 = load i64, ptr %local.obs_b.722
  %t862 = call i64 @"avg_transfer_mse"(i64 %t858, i64 %t859, i64 %t860, i64 %t861)
  store i64 %t862, ptr %local.trans.724
  %t863 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.145)
  %t864 = ptrtoint ptr %t863 to i64
  %t865 = inttoptr i64 %t864 to ptr
  call void @intrinsic_print(ptr %t865)
  %t866 = load i64, ptr %local.fresh.723
  %t867 = call i64 @"print_f64"(i64 %t866)
  %t868 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.146)
  %t869 = ptrtoint ptr %t868 to i64
  %t870 = inttoptr i64 %t869 to ptr
  call void @intrinsic_print(ptr %t870)
  %t871 = load i64, ptr %local.trans.724
  %t872 = call i64 @"print_f64"(i64 %t871)
  %t873 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.147)
  %t874 = ptrtoint ptr %t873 to i64
  %t875 = inttoptr i64 %t874 to ptr
  call void @intrinsic_print(ptr %t875)
  %t876 = load i64, ptr %local.trans.724
  %t877 = load i64, ptr %local.fresh.723
  %t878 = call i64 @"sx_f64_lt"(i64 %t876, i64 %t877)
  %t879 = icmp ne i64 %t878, 0
  br i1 %t879, label %then27, label %else27
then27:
  %t880 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.148)
  %t881 = ptrtoint ptr %t880 to i64
  %t882 = inttoptr i64 %t881 to ptr
  call void @intrinsic_print(ptr %t882)
  br label %then27_end
then27_end:
  br label %endif27
else27:
  %t883 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.149)
  %t884 = ptrtoint ptr %t883 to i64
  %t885 = inttoptr i64 %t884 to ptr
  call void @intrinsic_print(ptr %t885)
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t886 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t887 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.150)
  %t888 = ptrtoint ptr %t887 to i64
  %t889 = inttoptr i64 %t888 to ptr
  call void @intrinsic_println(ptr %t889)
  %t890 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.151)
  %t891 = ptrtoint ptr %t890 to i64
  %t892 = inttoptr i64 %t891 to ptr
  call void @intrinsic_println(ptr %t892)
  %t893 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.152)
  %t894 = ptrtoint ptr %t893 to i64
  %t895 = inttoptr i64 %t894 to ptr
  call void @intrinsic_println(ptr %t895)
  %t896 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.153)
  %t897 = ptrtoint ptr %t896 to i64
  %t898 = inttoptr i64 %t897 to ptr
  call void @intrinsic_println(ptr %t898)
  %t899 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.154)
  %t900 = ptrtoint ptr %t899 to i64
  %t901 = inttoptr i64 %t900 to ptr
  call void @intrinsic_println(ptr %t901)
  %t902 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.155)
  %t903 = ptrtoint ptr %t902 to i64
  %t904 = inttoptr i64 %t903 to ptr
  call void @intrinsic_println(ptr %t904)
  %t905 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.156)
  %t906 = ptrtoint ptr %t905 to i64
  %t907 = inttoptr i64 %t906 to ptr
  call void @intrinsic_println(ptr %t907)
  ret i64 0
}

define i64 @"train_self_referential"(i64 %true_val, i64 %coupling, i64 %obs, i64 %seed) nounwind {
entry:
  %local.al.908 = alloca i64
  %local.be.909 = alloca i64
  %local.m_al.910 = alloca i64
  %local.m_be.911 = alloca i64
  %local.rng.912 = alloca i64
  %local.step.913 = alloca i64
  %local.total_err.914 = alloca i64
  %local.prev_err.915 = alloca i64
  %local.curr_err.916 = alloca i64
  %local.meta_conf.917 = alloca i64
  %local.rate.918 = alloca i64
  %local.err.919 = alloca i64
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t920 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.157)
  store i64 %t920, ptr %local.al.908
  %t921 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.158)
  store i64 %t921, ptr %local.be.909
  %t922 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.159)
  store i64 %t922, ptr %local.m_al.910
  %t923 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.160)
  store i64 %t923, ptr %local.m_be.911
  %t924 = load i64, ptr %local.seed
  store i64 %t924, ptr %local.rng.912
  store i64 0, ptr %local.step.913
  %t925 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.161)
  store i64 %t925, ptr %local.total_err.914
  %t926 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.162)
  store i64 %t926, ptr %local.prev_err.915
  %t927 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.163)
  store i64 %t927, ptr %local.curr_err.916
  %t928 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.164)
  store i64 %t928, ptr %local.meta_conf.917
  %t929 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.165)
  store i64 %t929, ptr %local.rate.918
  br label %loop28
loop28:
  %t930 = load i64, ptr %local.step.913
  %t931 = load i64, ptr %local.obs
  %t932 = icmp slt i64 %t930, %t931
  %t933 = zext i1 %t932 to i64
  %t934 = icmp ne i64 %t933, 0
  br i1 %t934, label %body28, label %endloop28
body28:
  %t935 = load i64, ptr %local.al.908
  %t936 = load i64, ptr %local.be.909
  %t937 = call i64 @"beta_mean"(i64 %t935, i64 %t936)
  %t938 = load i64, ptr %local.true_val
  %t939 = call i64 @"sx_f64_sub"(i64 %t937, i64 %t938)
  %t940 = call i64 @"abs_f64"(i64 %t939)
  store i64 %t940, ptr %local.curr_err.916
  %t941 = load i64, ptr %local.step.913
  %t942 = icmp sgt i64 %t941, 0
  %t943 = zext i1 %t942 to i64
  %t944 = icmp ne i64 %t943, 0
  br i1 %t944, label %then29, label %else29
then29:
  %t945 = load i64, ptr %local.curr_err.916
  %t946 = load i64, ptr %local.prev_err.915
  %t947 = call i64 @"sx_f64_lt"(i64 %t945, i64 %t946)
  %t948 = icmp ne i64 %t947, 0
  br i1 %t948, label %then30, label %else30
then30:
  %t949 = load i64, ptr %local.m_al.910
  %t950 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.166)
  %t951 = call i64 @"sx_f64_add"(i64 %t949, i64 %t950)
  store i64 %t951, ptr %local.m_al.910
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t952 = load i64, ptr %local.m_be.911
  %t953 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.167)
  %t954 = call i64 @"sx_f64_add"(i64 %t952, i64 %t953)
  store i64 %t954, ptr %local.m_be.911
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t955 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t956 = phi i64 [ %t955, %then29_end ], [ 0, %else29_end ]
  %t957 = load i64, ptr %local.m_al.910
  %t958 = load i64, ptr %local.m_be.911
  %t959 = call i64 @"beta_mean"(i64 %t957, i64 %t958)
  store i64 %t959, ptr %local.meta_conf.917
  %t960 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.168)
  %t961 = load i64, ptr %local.coupling
  %t962 = load i64, ptr %local.meta_conf.917
  %t963 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.169)
  %t964 = call i64 @"sx_f64_sub"(i64 %t962, i64 %t963)
  %t965 = call i64 @"sx_f64_mul"(i64 %t961, i64 %t964)
  %t966 = call i64 @"sx_f64_add"(i64 %t960, i64 %t965)
  store i64 %t966, ptr %local.rate.918
  %t967 = load i64, ptr %local.rate.918
  %t968 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.170)
  %t969 = call i64 @"sx_f64_lt"(i64 %t967, i64 %t968)
  %t970 = icmp ne i64 %t969, 0
  br i1 %t970, label %then31, label %else31
then31:
  %t971 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.171)
  store i64 %t971, ptr %local.rate.918
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t972 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t973 = load i64, ptr %local.rate.918
  %t974 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.172)
  %t975 = call i64 @"sx_f64_gt"(i64 %t973, i64 %t974)
  %t976 = icmp ne i64 %t975, 0
  br i1 %t976, label %then32, label %else32
then32:
  %t977 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.173)
  store i64 %t977, ptr %local.rate.918
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t978 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t979 = load i64, ptr %local.rng.912
  %t980 = call i64 @"lcg_next"(i64 %t979)
  store i64 %t980, ptr %local.rng.912
  %t981 = load i64, ptr %local.rng.912
  %t982 = call i64 @"lcg_f64"(i64 %t981)
  %t983 = load i64, ptr %local.true_val
  %t984 = call i64 @"sx_f64_lt"(i64 %t982, i64 %t983)
  %t985 = icmp ne i64 %t984, 0
  br i1 %t985, label %then33, label %else33
then33:
  %t986 = load i64, ptr %local.al.908
  %t987 = load i64, ptr %local.rate.918
  %t988 = call i64 @"sx_f64_add"(i64 %t986, i64 %t987)
  store i64 %t988, ptr %local.al.908
  br label %then33_end
then33_end:
  br label %endif33
else33:
  %t989 = load i64, ptr %local.be.909
  %t990 = load i64, ptr %local.rate.918
  %t991 = call i64 @"sx_f64_add"(i64 %t989, i64 %t990)
  store i64 %t991, ptr %local.be.909
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t992 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t993 = load i64, ptr %local.curr_err.916
  store i64 %t993, ptr %local.prev_err.915
  %t994 = load i64, ptr %local.al.908
  %t995 = load i64, ptr %local.be.909
  %t996 = call i64 @"beta_mean"(i64 %t994, i64 %t995)
  %t997 = load i64, ptr %local.true_val
  %t998 = call i64 @"sx_f64_sub"(i64 %t996, i64 %t997)
  store i64 %t998, ptr %local.err.919
  %t999 = load i64, ptr %local.total_err.914
  %t1000 = load i64, ptr %local.err.919
  %t1001 = load i64, ptr %local.err.919
  %t1002 = call i64 @"sx_f64_mul"(i64 %t1000, i64 %t1001)
  %t1003 = call i64 @"sx_f64_add"(i64 %t999, i64 %t1002)
  store i64 %t1003, ptr %local.total_err.914
  %t1004 = load i64, ptr %local.step.913
  %t1005 = add i64 %t1004, 1
  store i64 %t1005, ptr %local.step.913
  br label %loop28
endloop28:
  %t1006 = load i64, ptr %local.total_err.914
  %t1007 = load i64, ptr %local.obs
  %t1008 = call i64 @"sx_int_to_f64"(i64 %t1007)
  %t1009 = call i64 @"sx_f64_div"(i64 %t1006, i64 %t1008)
  ret i64 %t1009
}

define i64 @"avg_self_ref"(i64 %true_val, i64 %coupling, i64 %obs) nounwind {
entry:
  %local.l1.1010 = alloca i64
  %local.l2.1011 = alloca i64
  %local.l3.1012 = alloca i64
  %local.l4.1013 = alloca i64
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t1014 = load i64, ptr %local.true_val
  %t1015 = load i64, ptr %local.coupling
  %t1016 = load i64, ptr %local.obs
  %t1017 = call i64 @"train_self_referential"(i64 %t1014, i64 %t1015, i64 %t1016, i64 42)
  store i64 %t1017, ptr %local.l1.1010
  %t1018 = load i64, ptr %local.true_val
  %t1019 = load i64, ptr %local.coupling
  %t1020 = load i64, ptr %local.obs
  %t1021 = call i64 @"train_self_referential"(i64 %t1018, i64 %t1019, i64 %t1020, i64 137)
  store i64 %t1021, ptr %local.l2.1011
  %t1022 = load i64, ptr %local.true_val
  %t1023 = load i64, ptr %local.coupling
  %t1024 = load i64, ptr %local.obs
  %t1025 = call i64 @"train_self_referential"(i64 %t1022, i64 %t1023, i64 %t1024, i64 999)
  store i64 %t1025, ptr %local.l3.1012
  %t1026 = load i64, ptr %local.true_val
  %t1027 = load i64, ptr %local.coupling
  %t1028 = load i64, ptr %local.obs
  %t1029 = call i64 @"train_self_referential"(i64 %t1026, i64 %t1027, i64 %t1028, i64 2023)
  store i64 %t1029, ptr %local.l4.1013
  %t1030 = load i64, ptr %local.l1.1010
  %t1031 = load i64, ptr %local.l2.1011
  %t1032 = call i64 @"sx_f64_add"(i64 %t1030, i64 %t1031)
  %t1033 = load i64, ptr %local.l3.1012
  %t1034 = call i64 @"sx_f64_add"(i64 %t1032, i64 %t1033)
  %t1035 = load i64, ptr %local.l4.1013
  %t1036 = call i64 @"sx_f64_add"(i64 %t1034, i64 %t1035)
  %t1037 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.174)
  %t1038 = call i64 @"sx_f64_div"(i64 %t1036, i64 %t1037)
  ret i64 %t1038
}

define i64 @"mg_coupling"(i64 %true_val, i64 %coupling, i64 %obs) nounwind {
entry:
  %local.h.1039 = alloca i64
  %local.lp.1040 = alloca i64
  %local.lm.1041 = alloca i64
  %local.true_val = alloca i64
  store i64 %true_val, ptr %local.true_val
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t1042 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.175)
  store i64 %t1042, ptr %local.h.1039
  %t1043 = load i64, ptr %local.true_val
  %t1044 = load i64, ptr %local.coupling
  %t1045 = load i64, ptr %local.h.1039
  %t1046 = call i64 @"sx_f64_add"(i64 %t1044, i64 %t1045)
  %t1047 = load i64, ptr %local.obs
  %t1048 = call i64 @"avg_self_ref"(i64 %t1043, i64 %t1046, i64 %t1047)
  store i64 %t1048, ptr %local.lp.1040
  %t1049 = load i64, ptr %local.true_val
  %t1050 = load i64, ptr %local.coupling
  %t1051 = load i64, ptr %local.h.1039
  %t1052 = call i64 @"sx_f64_sub"(i64 %t1050, i64 %t1051)
  %t1053 = load i64, ptr %local.obs
  %t1054 = call i64 @"avg_self_ref"(i64 %t1049, i64 %t1052, i64 %t1053)
  store i64 %t1054, ptr %local.lm.1041
  %t1055 = load i64, ptr %local.lp.1040
  %t1056 = load i64, ptr %local.lm.1041
  %t1057 = call i64 @"sx_f64_sub"(i64 %t1055, i64 %t1056)
  %t1058 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.176)
  %t1059 = load i64, ptr %local.h.1039
  %t1060 = call i64 @"sx_f64_mul"(i64 %t1058, i64 %t1059)
  %t1061 = call i64 @"sx_f64_div"(i64 %t1057, i64 %t1060)
  ret i64 %t1061
}

define i64 @"run_exp3"() nounwind {
entry:
  %local.obs.1062 = alloca i64
  %local.true_val.1063 = alloca i64
  %local.baseline.1064 = alloca i64
  %local.ci.1065 = alloca i64
  %local.best_coupling.1066 = alloca i64
  %local.best_mse.1067 = alloca i64
  %local.c.1068 = alloca i64
  %local.mse.1069 = alloca i64
  %local.learned_c.1070 = alloca i64
  %local.mg.1071 = alloca i64
  %local.cycle.1072 = alloca i64
  %local.learned_mse.1073 = alloca i64
  %t1074 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.177)
  %t1075 = ptrtoint ptr %t1074 to i64
  %t1076 = inttoptr i64 %t1075 to ptr
  call void @intrinsic_println(ptr %t1076)
  %t1077 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.178)
  %t1078 = ptrtoint ptr %t1077 to i64
  %t1079 = inttoptr i64 %t1078 to ptr
  call void @intrinsic_println(ptr %t1079)
  %t1080 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.179)
  %t1081 = ptrtoint ptr %t1080 to i64
  %t1082 = inttoptr i64 %t1081 to ptr
  call void @intrinsic_println(ptr %t1082)
  %t1083 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.180)
  %t1084 = ptrtoint ptr %t1083 to i64
  %t1085 = inttoptr i64 %t1084 to ptr
  call void @intrinsic_println(ptr %t1085)
  store i64 150, ptr %local.obs.1062
  %t1086 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.181)
  store i64 %t1086, ptr %local.true_val.1063
  %t1087 = load i64, ptr %local.true_val.1063
  %t1088 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.182)
  %t1089 = load i64, ptr %local.obs.1062
  %t1090 = call i64 @"avg_self_ref"(i64 %t1087, i64 %t1088, i64 %t1089)
  store i64 %t1090, ptr %local.baseline.1064
  %t1091 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.183)
  %t1092 = ptrtoint ptr %t1091 to i64
  %t1093 = inttoptr i64 %t1092 to ptr
  call void @intrinsic_print(ptr %t1093)
  %t1094 = load i64, ptr %local.baseline.1064
  %t1095 = call i64 @"print_f64"(i64 %t1094)
  %t1096 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.184)
  %t1097 = ptrtoint ptr %t1096 to i64
  %t1098 = inttoptr i64 %t1097 to ptr
  call void @intrinsic_println(ptr %t1098)
  %t1099 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.185)
  %t1100 = ptrtoint ptr %t1099 to i64
  %t1101 = inttoptr i64 %t1100 to ptr
  call void @intrinsic_println(ptr %t1101)
  %t1102 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.186)
  %t1103 = ptrtoint ptr %t1102 to i64
  %t1104 = inttoptr i64 %t1103 to ptr
  call void @intrinsic_println(ptr %t1104)
  store i64 0, ptr %local.ci.1065
  %t1105 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.187)
  store i64 %t1105, ptr %local.best_coupling.1066
  %t1106 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.188)
  store i64 %t1106, ptr %local.best_mse.1067
  br label %loop34
loop34:
  %t1107 = load i64, ptr %local.ci.1065
  %t1108 = icmp sle i64 %t1107, 8
  %t1109 = zext i1 %t1108 to i64
  %t1110 = icmp ne i64 %t1109, 0
  br i1 %t1110, label %body34, label %endloop34
body34:
  %t1111 = load i64, ptr %local.ci.1065
  %t1112 = call i64 @"sx_int_to_f64"(i64 %t1111)
  %t1113 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.189)
  %t1114 = call i64 @"sx_f64_mul"(i64 %t1112, i64 %t1113)
  store i64 %t1114, ptr %local.c.1068
  %t1115 = load i64, ptr %local.true_val.1063
  %t1116 = load i64, ptr %local.c.1068
  %t1117 = load i64, ptr %local.obs.1062
  %t1118 = call i64 @"avg_self_ref"(i64 %t1115, i64 %t1116, i64 %t1117)
  store i64 %t1118, ptr %local.mse.1069
  %t1119 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.190)
  %t1120 = ptrtoint ptr %t1119 to i64
  %t1121 = inttoptr i64 %t1120 to ptr
  call void @intrinsic_print(ptr %t1121)
  %t1122 = load i64, ptr %local.c.1068
  %t1123 = call i64 @"print_f64"(i64 %t1122)
  %t1124 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.191)
  %t1125 = ptrtoint ptr %t1124 to i64
  %t1126 = inttoptr i64 %t1125 to ptr
  call void @intrinsic_print(ptr %t1126)
  %t1127 = load i64, ptr %local.mse.1069
  %t1128 = call i64 @"print_f64"(i64 %t1127)
  %t1129 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.192)
  %t1130 = ptrtoint ptr %t1129 to i64
  %t1131 = inttoptr i64 %t1130 to ptr
  call void @intrinsic_print(ptr %t1131)
  %t1132 = load i64, ptr %local.mse.1069
  %t1133 = load i64, ptr %local.baseline.1064
  %t1134 = call i64 @"sx_f64_lt"(i64 %t1132, i64 %t1133)
  %t1135 = icmp ne i64 %t1134, 0
  br i1 %t1135, label %then35, label %else35
then35:
  %t1136 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.193)
  %t1137 = ptrtoint ptr %t1136 to i64
  %t1138 = inttoptr i64 %t1137 to ptr
  call void @intrinsic_print(ptr %t1138)
  br label %then35_end
then35_end:
  br label %endif35
else35:
  %t1139 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.194)
  %t1140 = ptrtoint ptr %t1139 to i64
  %t1141 = inttoptr i64 %t1140 to ptr
  call void @intrinsic_print(ptr %t1141)
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t1142 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t1143 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.195)
  %t1144 = ptrtoint ptr %t1143 to i64
  %t1145 = inttoptr i64 %t1144 to ptr
  call void @intrinsic_println(ptr %t1145)
  %t1146 = load i64, ptr %local.mse.1069
  %t1147 = load i64, ptr %local.best_mse.1067
  %t1148 = call i64 @"sx_f64_lt"(i64 %t1146, i64 %t1147)
  %t1149 = icmp ne i64 %t1148, 0
  br i1 %t1149, label %then36, label %else36
then36:
  %t1150 = load i64, ptr %local.mse.1069
  store i64 %t1150, ptr %local.best_mse.1067
  %t1151 = load i64, ptr %local.c.1068
  store i64 %t1151, ptr %local.best_coupling.1066
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1152 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t1153 = load i64, ptr %local.ci.1065
  %t1154 = add i64 %t1153, 1
  store i64 %t1154, ptr %local.ci.1065
  br label %loop34
endloop34:
  %t1155 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.196)
  %t1156 = ptrtoint ptr %t1155 to i64
  %t1157 = inttoptr i64 %t1156 to ptr
  call void @intrinsic_println(ptr %t1157)
  %t1158 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.197)
  %t1159 = ptrtoint ptr %t1158 to i64
  %t1160 = inttoptr i64 %t1159 to ptr
  call void @intrinsic_print(ptr %t1160)
  %t1161 = load i64, ptr %local.best_coupling.1066
  %t1162 = call i64 @"print_f64"(i64 %t1161)
  %t1163 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.198)
  %t1164 = ptrtoint ptr %t1163 to i64
  %t1165 = inttoptr i64 %t1164 to ptr
  call void @intrinsic_print(ptr %t1165)
  %t1166 = load i64, ptr %local.best_mse.1067
  %t1167 = call i64 @"print_f64"(i64 %t1166)
  %t1168 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.199)
  %t1169 = ptrtoint ptr %t1168 to i64
  %t1170 = inttoptr i64 %t1169 to ptr
  call void @intrinsic_println(ptr %t1170)
  %t1171 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.200)
  store i64 %t1171, ptr %local.learned_c.1070
  %t1172 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.201)
  store i64 %t1172, ptr %local.mg.1071
  store i64 0, ptr %local.cycle.1072
  br label %loop37
loop37:
  %t1173 = load i64, ptr %local.cycle.1072
  %t1174 = icmp slt i64 %t1173, 25
  %t1175 = zext i1 %t1174 to i64
  %t1176 = icmp ne i64 %t1175, 0
  br i1 %t1176, label %body37, label %endloop37
body37:
  %t1177 = load i64, ptr %local.true_val.1063
  %t1178 = load i64, ptr %local.learned_c.1070
  %t1179 = load i64, ptr %local.obs.1062
  %t1180 = call i64 @"mg_coupling"(i64 %t1177, i64 %t1178, i64 %t1179)
  store i64 %t1180, ptr %local.mg.1071
  %t1181 = load i64, ptr %local.learned_c.1070
  %t1182 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.202)
  %t1183 = load i64, ptr %local.mg.1071
  %t1184 = call i64 @"sx_f64_mul"(i64 %t1182, i64 %t1183)
  %t1185 = call i64 @"sx_f64_sub"(i64 %t1181, i64 %t1184)
  %t1186 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.203)
  %t1187 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.204)
  %t1188 = call i64 @"clamp"(i64 %t1185, i64 %t1186, i64 %t1187)
  store i64 %t1188, ptr %local.learned_c.1070
  %t1189 = load i64, ptr %local.cycle.1072
  %t1190 = add i64 %t1189, 1
  store i64 %t1190, ptr %local.cycle.1072
  br label %loop37
endloop37:
  %t1191 = load i64, ptr %local.true_val.1063
  %t1192 = load i64, ptr %local.learned_c.1070
  %t1193 = load i64, ptr %local.obs.1062
  %t1194 = call i64 @"avg_self_ref"(i64 %t1191, i64 %t1192, i64 %t1193)
  store i64 %t1194, ptr %local.learned_mse.1073
  %t1195 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.205)
  %t1196 = ptrtoint ptr %t1195 to i64
  %t1197 = inttoptr i64 %t1196 to ptr
  call void @intrinsic_print(ptr %t1197)
  %t1198 = load i64, ptr %local.learned_c.1070
  %t1199 = call i64 @"print_f64"(i64 %t1198)
  %t1200 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.206)
  %t1201 = ptrtoint ptr %t1200 to i64
  %t1202 = inttoptr i64 %t1201 to ptr
  call void @intrinsic_print(ptr %t1202)
  %t1203 = load i64, ptr %local.learned_mse.1073
  %t1204 = call i64 @"print_f64"(i64 %t1203)
  %t1205 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.207)
  %t1206 = ptrtoint ptr %t1205 to i64
  %t1207 = inttoptr i64 %t1206 to ptr
  call void @intrinsic_println(ptr %t1207)
  %t1208 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.208)
  %t1209 = ptrtoint ptr %t1208 to i64
  %t1210 = inttoptr i64 %t1209 to ptr
  call void @intrinsic_println(ptr %t1210)
  %t1211 = load i64, ptr %local.best_mse.1067
  %t1212 = load i64, ptr %local.baseline.1064
  %t1213 = call i64 @"sx_f64_lt"(i64 %t1211, i64 %t1212)
  %t1214 = icmp ne i64 %t1213, 0
  br i1 %t1214, label %then38, label %else38
then38:
  %t1215 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.209)
  %t1216 = ptrtoint ptr %t1215 to i64
  %t1217 = inttoptr i64 %t1216 to ptr
  call void @intrinsic_println(ptr %t1217)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1218 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t1219 = load i64, ptr %local.best_coupling.1066
  %t1220 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.210)
  %t1221 = call i64 @"sx_f64_gt"(i64 %t1219, i64 %t1220)
  %t1222 = icmp ne i64 %t1221, 0
  br i1 %t1222, label %then39, label %else39
then39:
  %t1223 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.211)
  %t1224 = ptrtoint ptr %t1223 to i64
  %t1225 = inttoptr i64 %t1224 to ptr
  call void @intrinsic_println(ptr %t1225)
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1226 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t1227 = load i64, ptr %local.learned_c.1070
  %t1228 = load i64, ptr %local.best_coupling.1066
  %t1229 = call i64 @"sx_f64_sub"(i64 %t1227, i64 %t1228)
  %t1230 = call i64 @"abs_f64"(i64 %t1229)
  %t1231 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.212)
  %t1232 = call i64 @"sx_f64_lt"(i64 %t1230, i64 %t1231)
  %t1233 = icmp ne i64 %t1232, 0
  br i1 %t1233, label %then40, label %else40
then40:
  %t1234 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.213)
  %t1235 = ptrtoint ptr %t1234 to i64
  %t1236 = inttoptr i64 %t1235 to ptr
  call void @intrinsic_println(ptr %t1236)
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1237 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t1238 = load i64, ptr %local.best_coupling.1066
  %t1239 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.214)
  %t1240 = call i64 @"sx_f64_gt"(i64 %t1238, i64 %t1239)
  %t1241 = icmp ne i64 %t1240, 0
  br i1 %t1241, label %then41, label %else41
then41:
  %t1242 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.215)
  %t1243 = ptrtoint ptr %t1242 to i64
  %t1244 = inttoptr i64 %t1243 to ptr
  call void @intrinsic_println(ptr %t1244)
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t1245 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t1246 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.216)
  %t1247 = ptrtoint ptr %t1246 to i64
  %t1248 = inttoptr i64 %t1247 to ptr
  call void @intrinsic_println(ptr %t1248)
  ret i64 0
}

define i64 @"get_true_val"(i64 %k) nounwind {
entry:
  %local.k = alloca i64
  store i64 %k, ptr %local.k
  %t1249 = load i64, ptr %local.k
  %t1250 = icmp eq i64 %t1249, 0
  %t1251 = zext i1 %t1250 to i64
  %t1252 = icmp ne i64 %t1251, 0
  br i1 %t1252, label %then42, label %else42
then42:
  %t1253 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.217)
  ret i64 %t1253
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1254 = phi i64 [ 0, %else42_end ]
  %t1255 = load i64, ptr %local.k
  %t1256 = icmp eq i64 %t1255, 1
  %t1257 = zext i1 %t1256 to i64
  %t1258 = icmp ne i64 %t1257, 0
  br i1 %t1258, label %then43, label %else43
then43:
  %t1259 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.218)
  ret i64 %t1259
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1260 = phi i64 [ 0, %else43_end ]
  %t1261 = load i64, ptr %local.k
  %t1262 = icmp eq i64 %t1261, 2
  %t1263 = zext i1 %t1262 to i64
  %t1264 = icmp ne i64 %t1263, 0
  br i1 %t1264, label %then44, label %else44
then44:
  %t1265 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.219)
  ret i64 %t1265
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t1266 = phi i64 [ 0, %else44_end ]
  %t1267 = load i64, ptr %local.k
  %t1268 = icmp eq i64 %t1267, 3
  %t1269 = zext i1 %t1268 to i64
  %t1270 = icmp ne i64 %t1269, 0
  br i1 %t1270, label %then45, label %else45
then45:
  %t1271 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.220)
  ret i64 %t1271
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t1272 = phi i64 [ 0, %else45_end ]
  %t1273 = load i64, ptr %local.k
  %t1274 = icmp eq i64 %t1273, 4
  %t1275 = zext i1 %t1274 to i64
  %t1276 = icmp ne i64 %t1275, 0
  br i1 %t1276, label %then46, label %else46
then46:
  %t1277 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.221)
  ret i64 %t1277
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1278 = phi i64 [ 0, %else46_end ]
  %t1279 = load i64, ptr %local.k
  %t1280 = icmp eq i64 %t1279, 5
  %t1281 = zext i1 %t1280 to i64
  %t1282 = icmp ne i64 %t1281, 0
  br i1 %t1282, label %then47, label %else47
then47:
  %t1283 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.222)
  ret i64 %t1283
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t1284 = phi i64 [ 0, %else47_end ]
  %t1285 = load i64, ptr %local.k
  %t1286 = icmp eq i64 %t1285, 6
  %t1287 = zext i1 %t1286 to i64
  %t1288 = icmp ne i64 %t1287, 0
  br i1 %t1288, label %then48, label %else48
then48:
  %t1289 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.223)
  ret i64 %t1289
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1290 = phi i64 [ 0, %else48_end ]
  %t1291 = load i64, ptr %local.k
  %t1292 = icmp eq i64 %t1291, 7
  %t1293 = zext i1 %t1292 to i64
  %t1294 = icmp ne i64 %t1293, 0
  br i1 %t1294, label %then49, label %else49
then49:
  %t1295 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.224)
  ret i64 %t1295
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1296 = phi i64 [ 0, %else49_end ]
  %t1297 = load i64, ptr %local.k
  %t1298 = icmp eq i64 %t1297, 8
  %t1299 = zext i1 %t1298 to i64
  %t1300 = icmp ne i64 %t1299, 0
  br i1 %t1300, label %then50, label %else50
then50:
  %t1301 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.225)
  ret i64 %t1301
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1302 = phi i64 [ 0, %else50_end ]
  %t1303 = load i64, ptr %local.k
  %t1304 = icmp eq i64 %t1303, 9
  %t1305 = zext i1 %t1304 to i64
  %t1306 = icmp ne i64 %t1305, 0
  br i1 %t1306, label %then51, label %else51
then51:
  %t1307 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.226)
  ret i64 %t1307
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t1308 = phi i64 [ 0, %else51_end ]
  %t1309 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.227)
  ret i64 %t1309
}

define i64 @"train_k_beliefs"(i64 %num_k, i64 %alpha, i64 %obs, i64 %seed) nounwind {
entry:
  %local.a0.1310 = alloca i64
  %local.b0.1311 = alloca i64
  %local.a1.1312 = alloca i64
  %local.b1.1313 = alloca i64
  %local.a2.1314 = alloca i64
  %local.b2.1315 = alloca i64
  %local.a3.1316 = alloca i64
  %local.b3.1317 = alloca i64
  %local.a4.1318 = alloca i64
  %local.b4.1319 = alloca i64
  %local.a5.1320 = alloca i64
  %local.b5.1321 = alloca i64
  %local.a6.1322 = alloca i64
  %local.b6.1323 = alloca i64
  %local.a7.1324 = alloca i64
  %local.b7.1325 = alloca i64
  %local.a8.1326 = alloca i64
  %local.b8.1327 = alloca i64
  %local.a9.1328 = alloca i64
  %local.b9.1329 = alloca i64
  %local.rng.1330 = alloca i64
  %local.step.1331 = alloca i64
  %local.avg_mean.1332 = alloca i64
  %local.boost.1333 = alloca i64
  %local.total_err.1334 = alloca i64
  %local.err.1335 = alloca i64
  %local.num_k = alloca i64
  store i64 %num_k, ptr %local.num_k
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %local.seed = alloca i64
  store i64 %seed, ptr %local.seed
  %t1336 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.228)
  store i64 %t1336, ptr %local.a0.1310
  %t1337 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.229)
  store i64 %t1337, ptr %local.b0.1311
  %t1338 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.230)
  store i64 %t1338, ptr %local.a1.1312
  %t1339 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.231)
  store i64 %t1339, ptr %local.b1.1313
  %t1340 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.232)
  store i64 %t1340, ptr %local.a2.1314
  %t1341 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.233)
  store i64 %t1341, ptr %local.b2.1315
  %t1342 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.234)
  store i64 %t1342, ptr %local.a3.1316
  %t1343 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.235)
  store i64 %t1343, ptr %local.b3.1317
  %t1344 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.236)
  store i64 %t1344, ptr %local.a4.1318
  %t1345 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.237)
  store i64 %t1345, ptr %local.b4.1319
  %t1346 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.238)
  store i64 %t1346, ptr %local.a5.1320
  %t1347 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.239)
  store i64 %t1347, ptr %local.b5.1321
  %t1348 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.240)
  store i64 %t1348, ptr %local.a6.1322
  %t1349 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.241)
  store i64 %t1349, ptr %local.b6.1323
  %t1350 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.242)
  store i64 %t1350, ptr %local.a7.1324
  %t1351 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.243)
  store i64 %t1351, ptr %local.b7.1325
  %t1352 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.244)
  store i64 %t1352, ptr %local.a8.1326
  %t1353 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.245)
  store i64 %t1353, ptr %local.b8.1327
  %t1354 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.246)
  store i64 %t1354, ptr %local.a9.1328
  %t1355 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.247)
  store i64 %t1355, ptr %local.b9.1329
  %t1356 = load i64, ptr %local.seed
  store i64 %t1356, ptr %local.rng.1330
  store i64 0, ptr %local.step.1331
  %t1357 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.248)
  store i64 %t1357, ptr %local.avg_mean.1332
  %t1358 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.249)
  store i64 %t1358, ptr %local.boost.1333
  br label %loop52
loop52:
  %t1359 = load i64, ptr %local.step.1331
  %t1360 = load i64, ptr %local.obs
  %t1361 = icmp slt i64 %t1359, %t1360
  %t1362 = zext i1 %t1361 to i64
  %t1363 = icmp ne i64 %t1362, 0
  br i1 %t1363, label %body52, label %endloop52
body52:
  %t1364 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.250)
  store i64 %t1364, ptr %local.avg_mean.1332
  %t1365 = load i64, ptr %local.num_k
  %t1366 = icmp sgt i64 %t1365, 0
  %t1367 = zext i1 %t1366 to i64
  %t1368 = icmp ne i64 %t1367, 0
  br i1 %t1368, label %then53, label %else53
then53:
  %t1369 = load i64, ptr %local.avg_mean.1332
  %t1370 = load i64, ptr %local.a0.1310
  %t1371 = load i64, ptr %local.b0.1311
  %t1372 = call i64 @"beta_mean"(i64 %t1370, i64 %t1371)
  %t1373 = call i64 @"sx_f64_add"(i64 %t1369, i64 %t1372)
  store i64 %t1373, ptr %local.avg_mean.1332
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t1374 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t1375 = load i64, ptr %local.num_k
  %t1376 = icmp sgt i64 %t1375, 1
  %t1377 = zext i1 %t1376 to i64
  %t1378 = icmp ne i64 %t1377, 0
  br i1 %t1378, label %then54, label %else54
then54:
  %t1379 = load i64, ptr %local.avg_mean.1332
  %t1380 = load i64, ptr %local.a1.1312
  %t1381 = load i64, ptr %local.b1.1313
  %t1382 = call i64 @"beta_mean"(i64 %t1380, i64 %t1381)
  %t1383 = call i64 @"sx_f64_add"(i64 %t1379, i64 %t1382)
  store i64 %t1383, ptr %local.avg_mean.1332
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t1384 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t1385 = load i64, ptr %local.num_k
  %t1386 = icmp sgt i64 %t1385, 2
  %t1387 = zext i1 %t1386 to i64
  %t1388 = icmp ne i64 %t1387, 0
  br i1 %t1388, label %then55, label %else55
then55:
  %t1389 = load i64, ptr %local.avg_mean.1332
  %t1390 = load i64, ptr %local.a2.1314
  %t1391 = load i64, ptr %local.b2.1315
  %t1392 = call i64 @"beta_mean"(i64 %t1390, i64 %t1391)
  %t1393 = call i64 @"sx_f64_add"(i64 %t1389, i64 %t1392)
  store i64 %t1393, ptr %local.avg_mean.1332
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t1394 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t1395 = load i64, ptr %local.num_k
  %t1396 = icmp sgt i64 %t1395, 3
  %t1397 = zext i1 %t1396 to i64
  %t1398 = icmp ne i64 %t1397, 0
  br i1 %t1398, label %then56, label %else56
then56:
  %t1399 = load i64, ptr %local.avg_mean.1332
  %t1400 = load i64, ptr %local.a3.1316
  %t1401 = load i64, ptr %local.b3.1317
  %t1402 = call i64 @"beta_mean"(i64 %t1400, i64 %t1401)
  %t1403 = call i64 @"sx_f64_add"(i64 %t1399, i64 %t1402)
  store i64 %t1403, ptr %local.avg_mean.1332
  br label %then56_end
then56_end:
  br label %endif56
else56:
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t1404 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t1405 = load i64, ptr %local.num_k
  %t1406 = icmp sgt i64 %t1405, 4
  %t1407 = zext i1 %t1406 to i64
  %t1408 = icmp ne i64 %t1407, 0
  br i1 %t1408, label %then57, label %else57
then57:
  %t1409 = load i64, ptr %local.avg_mean.1332
  %t1410 = load i64, ptr %local.a4.1318
  %t1411 = load i64, ptr %local.b4.1319
  %t1412 = call i64 @"beta_mean"(i64 %t1410, i64 %t1411)
  %t1413 = call i64 @"sx_f64_add"(i64 %t1409, i64 %t1412)
  store i64 %t1413, ptr %local.avg_mean.1332
  br label %then57_end
then57_end:
  br label %endif57
else57:
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t1414 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t1415 = load i64, ptr %local.num_k
  %t1416 = icmp sgt i64 %t1415, 5
  %t1417 = zext i1 %t1416 to i64
  %t1418 = icmp ne i64 %t1417, 0
  br i1 %t1418, label %then58, label %else58
then58:
  %t1419 = load i64, ptr %local.avg_mean.1332
  %t1420 = load i64, ptr %local.a5.1320
  %t1421 = load i64, ptr %local.b5.1321
  %t1422 = call i64 @"beta_mean"(i64 %t1420, i64 %t1421)
  %t1423 = call i64 @"sx_f64_add"(i64 %t1419, i64 %t1422)
  store i64 %t1423, ptr %local.avg_mean.1332
  br label %then58_end
then58_end:
  br label %endif58
else58:
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t1424 = phi i64 [ 0, %then58_end ], [ 0, %else58_end ]
  %t1425 = load i64, ptr %local.num_k
  %t1426 = icmp sgt i64 %t1425, 6
  %t1427 = zext i1 %t1426 to i64
  %t1428 = icmp ne i64 %t1427, 0
  br i1 %t1428, label %then59, label %else59
then59:
  %t1429 = load i64, ptr %local.avg_mean.1332
  %t1430 = load i64, ptr %local.a6.1322
  %t1431 = load i64, ptr %local.b6.1323
  %t1432 = call i64 @"beta_mean"(i64 %t1430, i64 %t1431)
  %t1433 = call i64 @"sx_f64_add"(i64 %t1429, i64 %t1432)
  store i64 %t1433, ptr %local.avg_mean.1332
  br label %then59_end
then59_end:
  br label %endif59
else59:
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t1434 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  %t1435 = load i64, ptr %local.num_k
  %t1436 = icmp sgt i64 %t1435, 7
  %t1437 = zext i1 %t1436 to i64
  %t1438 = icmp ne i64 %t1437, 0
  br i1 %t1438, label %then60, label %else60
then60:
  %t1439 = load i64, ptr %local.avg_mean.1332
  %t1440 = load i64, ptr %local.a7.1324
  %t1441 = load i64, ptr %local.b7.1325
  %t1442 = call i64 @"beta_mean"(i64 %t1440, i64 %t1441)
  %t1443 = call i64 @"sx_f64_add"(i64 %t1439, i64 %t1442)
  store i64 %t1443, ptr %local.avg_mean.1332
  br label %then60_end
then60_end:
  br label %endif60
else60:
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t1444 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  %t1445 = load i64, ptr %local.num_k
  %t1446 = icmp sgt i64 %t1445, 8
  %t1447 = zext i1 %t1446 to i64
  %t1448 = icmp ne i64 %t1447, 0
  br i1 %t1448, label %then61, label %else61
then61:
  %t1449 = load i64, ptr %local.avg_mean.1332
  %t1450 = load i64, ptr %local.a8.1326
  %t1451 = load i64, ptr %local.b8.1327
  %t1452 = call i64 @"beta_mean"(i64 %t1450, i64 %t1451)
  %t1453 = call i64 @"sx_f64_add"(i64 %t1449, i64 %t1452)
  store i64 %t1453, ptr %local.avg_mean.1332
  br label %then61_end
then61_end:
  br label %endif61
else61:
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t1454 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t1455 = load i64, ptr %local.num_k
  %t1456 = icmp sgt i64 %t1455, 9
  %t1457 = zext i1 %t1456 to i64
  %t1458 = icmp ne i64 %t1457, 0
  br i1 %t1458, label %then62, label %else62
then62:
  %t1459 = load i64, ptr %local.avg_mean.1332
  %t1460 = load i64, ptr %local.a9.1328
  %t1461 = load i64, ptr %local.b9.1329
  %t1462 = call i64 @"beta_mean"(i64 %t1460, i64 %t1461)
  %t1463 = call i64 @"sx_f64_add"(i64 %t1459, i64 %t1462)
  store i64 %t1463, ptr %local.avg_mean.1332
  br label %then62_end
then62_end:
  br label %endif62
else62:
  br label %else62_end
else62_end:
  br label %endif62
endif62:
  %t1464 = phi i64 [ 0, %then62_end ], [ 0, %else62_end ]
  %t1465 = load i64, ptr %local.avg_mean.1332
  %t1466 = load i64, ptr %local.num_k
  %t1467 = call i64 @"sx_int_to_f64"(i64 %t1466)
  %t1468 = call i64 @"sx_f64_div"(i64 %t1465, i64 %t1467)
  store i64 %t1468, ptr %local.avg_mean.1332
  %t1469 = load i64, ptr %local.num_k
  %t1470 = icmp sgt i64 %t1469, 0
  %t1471 = zext i1 %t1470 to i64
  %t1472 = icmp ne i64 %t1471, 0
  br i1 %t1472, label %then63, label %else63
then63:
  %t1473 = load i64, ptr %local.rng.1330
  %t1474 = call i64 @"lcg_next"(i64 %t1473)
  store i64 %t1474, ptr %local.rng.1330
  %t1475 = load i64, ptr %local.alpha
  %t1476 = load i64, ptr %local.avg_mean.1332
  %t1477 = load i64, ptr %local.a0.1310
  %t1478 = load i64, ptr %local.b0.1311
  %t1479 = call i64 @"beta_mean"(i64 %t1477, i64 %t1478)
  %t1480 = call i64 @"sx_f64_sub"(i64 %t1476, i64 %t1479)
  %t1481 = call i64 @"sx_f64_mul"(i64 %t1475, i64 %t1480)
  %t1482 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.251)
  %t1483 = call i64 @"sx_f64_mul"(i64 %t1481, i64 %t1482)
  store i64 %t1483, ptr %local.boost.1333
  %t1484 = load i64, ptr %local.rng.1330
  %t1485 = call i64 @"lcg_f64"(i64 %t1484)
  %t1486 = call i64 @"get_true_val"(i64 0)
  %t1487 = icmp slt i64 %t1485, %t1486
  %t1488 = zext i1 %t1487 to i64
  %t1489 = icmp ne i64 %t1488, 0
  br i1 %t1489, label %then64, label %else64
then64:
  %t1490 = load i64, ptr %local.a0.1310
  %t1491 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.252)
  %t1492 = call i64 @"sx_f64_add"(i64 %t1490, i64 %t1491)
  %t1493 = load i64, ptr %local.boost.1333
  %t1494 = call i64 @"sx_f64_add"(i64 %t1492, i64 %t1493)
  store i64 %t1494, ptr %local.a0.1310
  br label %then64_end
then64_end:
  br label %endif64
else64:
  %t1495 = load i64, ptr %local.b0.1311
  %t1496 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.253)
  %t1497 = call i64 @"sx_f64_add"(i64 %t1495, i64 %t1496)
  %t1498 = load i64, ptr %local.boost.1333
  %t1499 = call i64 @"sx_f64_sub"(i64 %t1497, i64 %t1498)
  store i64 %t1499, ptr %local.b0.1311
  br label %else64_end
else64_end:
  br label %endif64
endif64:
  %t1500 = phi i64 [ 0, %then64_end ], [ 0, %else64_end ]
  br label %then63_end
then63_end:
  br label %endif63
else63:
  br label %else63_end
else63_end:
  br label %endif63
endif63:
  %t1501 = phi i64 [ %t1500, %then63_end ], [ 0, %else63_end ]
  %t1502 = load i64, ptr %local.num_k
  %t1503 = icmp sgt i64 %t1502, 1
  %t1504 = zext i1 %t1503 to i64
  %t1505 = icmp ne i64 %t1504, 0
  br i1 %t1505, label %then65, label %else65
then65:
  %t1506 = load i64, ptr %local.rng.1330
  %t1507 = call i64 @"lcg_next"(i64 %t1506)
  store i64 %t1507, ptr %local.rng.1330
  %t1508 = load i64, ptr %local.alpha
  %t1509 = load i64, ptr %local.avg_mean.1332
  %t1510 = load i64, ptr %local.a1.1312
  %t1511 = load i64, ptr %local.b1.1313
  %t1512 = call i64 @"beta_mean"(i64 %t1510, i64 %t1511)
  %t1513 = call i64 @"sx_f64_sub"(i64 %t1509, i64 %t1512)
  %t1514 = call i64 @"sx_f64_mul"(i64 %t1508, i64 %t1513)
  %t1515 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.254)
  %t1516 = call i64 @"sx_f64_mul"(i64 %t1514, i64 %t1515)
  store i64 %t1516, ptr %local.boost.1333
  %t1517 = load i64, ptr %local.rng.1330
  %t1518 = call i64 @"lcg_f64"(i64 %t1517)
  %t1519 = call i64 @"get_true_val"(i64 1)
  %t1520 = icmp slt i64 %t1518, %t1519
  %t1521 = zext i1 %t1520 to i64
  %t1522 = icmp ne i64 %t1521, 0
  br i1 %t1522, label %then66, label %else66
then66:
  %t1523 = load i64, ptr %local.a1.1312
  %t1524 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.255)
  %t1525 = call i64 @"sx_f64_add"(i64 %t1523, i64 %t1524)
  %t1526 = load i64, ptr %local.boost.1333
  %t1527 = call i64 @"sx_f64_add"(i64 %t1525, i64 %t1526)
  store i64 %t1527, ptr %local.a1.1312
  br label %then66_end
then66_end:
  br label %endif66
else66:
  %t1528 = load i64, ptr %local.b1.1313
  %t1529 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.256)
  %t1530 = call i64 @"sx_f64_add"(i64 %t1528, i64 %t1529)
  %t1531 = load i64, ptr %local.boost.1333
  %t1532 = call i64 @"sx_f64_sub"(i64 %t1530, i64 %t1531)
  store i64 %t1532, ptr %local.b1.1313
  br label %else66_end
else66_end:
  br label %endif66
endif66:
  %t1533 = phi i64 [ 0, %then66_end ], [ 0, %else66_end ]
  br label %then65_end
then65_end:
  br label %endif65
else65:
  br label %else65_end
else65_end:
  br label %endif65
endif65:
  %t1534 = phi i64 [ %t1533, %then65_end ], [ 0, %else65_end ]
  %t1535 = load i64, ptr %local.num_k
  %t1536 = icmp sgt i64 %t1535, 2
  %t1537 = zext i1 %t1536 to i64
  %t1538 = icmp ne i64 %t1537, 0
  br i1 %t1538, label %then67, label %else67
then67:
  %t1539 = load i64, ptr %local.rng.1330
  %t1540 = call i64 @"lcg_next"(i64 %t1539)
  store i64 %t1540, ptr %local.rng.1330
  %t1541 = load i64, ptr %local.alpha
  %t1542 = load i64, ptr %local.avg_mean.1332
  %t1543 = load i64, ptr %local.a2.1314
  %t1544 = load i64, ptr %local.b2.1315
  %t1545 = call i64 @"beta_mean"(i64 %t1543, i64 %t1544)
  %t1546 = call i64 @"sx_f64_sub"(i64 %t1542, i64 %t1545)
  %t1547 = call i64 @"sx_f64_mul"(i64 %t1541, i64 %t1546)
  %t1548 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.257)
  %t1549 = call i64 @"sx_f64_mul"(i64 %t1547, i64 %t1548)
  store i64 %t1549, ptr %local.boost.1333
  %t1550 = load i64, ptr %local.rng.1330
  %t1551 = call i64 @"lcg_f64"(i64 %t1550)
  %t1552 = call i64 @"get_true_val"(i64 2)
  %t1553 = icmp slt i64 %t1551, %t1552
  %t1554 = zext i1 %t1553 to i64
  %t1555 = icmp ne i64 %t1554, 0
  br i1 %t1555, label %then68, label %else68
then68:
  %t1556 = load i64, ptr %local.a2.1314
  %t1557 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.258)
  %t1558 = call i64 @"sx_f64_add"(i64 %t1556, i64 %t1557)
  %t1559 = load i64, ptr %local.boost.1333
  %t1560 = call i64 @"sx_f64_add"(i64 %t1558, i64 %t1559)
  store i64 %t1560, ptr %local.a2.1314
  br label %then68_end
then68_end:
  br label %endif68
else68:
  %t1561 = load i64, ptr %local.b2.1315
  %t1562 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.259)
  %t1563 = call i64 @"sx_f64_add"(i64 %t1561, i64 %t1562)
  %t1564 = load i64, ptr %local.boost.1333
  %t1565 = call i64 @"sx_f64_sub"(i64 %t1563, i64 %t1564)
  store i64 %t1565, ptr %local.b2.1315
  br label %else68_end
else68_end:
  br label %endif68
endif68:
  %t1566 = phi i64 [ 0, %then68_end ], [ 0, %else68_end ]
  br label %then67_end
then67_end:
  br label %endif67
else67:
  br label %else67_end
else67_end:
  br label %endif67
endif67:
  %t1567 = phi i64 [ %t1566, %then67_end ], [ 0, %else67_end ]
  %t1568 = load i64, ptr %local.num_k
  %t1569 = icmp sgt i64 %t1568, 3
  %t1570 = zext i1 %t1569 to i64
  %t1571 = icmp ne i64 %t1570, 0
  br i1 %t1571, label %then69, label %else69
then69:
  %t1572 = load i64, ptr %local.rng.1330
  %t1573 = call i64 @"lcg_next"(i64 %t1572)
  store i64 %t1573, ptr %local.rng.1330
  %t1574 = load i64, ptr %local.alpha
  %t1575 = load i64, ptr %local.avg_mean.1332
  %t1576 = load i64, ptr %local.a3.1316
  %t1577 = load i64, ptr %local.b3.1317
  %t1578 = call i64 @"beta_mean"(i64 %t1576, i64 %t1577)
  %t1579 = call i64 @"sx_f64_sub"(i64 %t1575, i64 %t1578)
  %t1580 = call i64 @"sx_f64_mul"(i64 %t1574, i64 %t1579)
  %t1581 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.260)
  %t1582 = call i64 @"sx_f64_mul"(i64 %t1580, i64 %t1581)
  store i64 %t1582, ptr %local.boost.1333
  %t1583 = load i64, ptr %local.rng.1330
  %t1584 = call i64 @"lcg_f64"(i64 %t1583)
  %t1585 = call i64 @"get_true_val"(i64 3)
  %t1586 = icmp slt i64 %t1584, %t1585
  %t1587 = zext i1 %t1586 to i64
  %t1588 = icmp ne i64 %t1587, 0
  br i1 %t1588, label %then70, label %else70
then70:
  %t1589 = load i64, ptr %local.a3.1316
  %t1590 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.261)
  %t1591 = call i64 @"sx_f64_add"(i64 %t1589, i64 %t1590)
  %t1592 = load i64, ptr %local.boost.1333
  %t1593 = call i64 @"sx_f64_add"(i64 %t1591, i64 %t1592)
  store i64 %t1593, ptr %local.a3.1316
  br label %then70_end
then70_end:
  br label %endif70
else70:
  %t1594 = load i64, ptr %local.b3.1317
  %t1595 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.262)
  %t1596 = call i64 @"sx_f64_add"(i64 %t1594, i64 %t1595)
  %t1597 = load i64, ptr %local.boost.1333
  %t1598 = call i64 @"sx_f64_sub"(i64 %t1596, i64 %t1597)
  store i64 %t1598, ptr %local.b3.1317
  br label %else70_end
else70_end:
  br label %endif70
endif70:
  %t1599 = phi i64 [ 0, %then70_end ], [ 0, %else70_end ]
  br label %then69_end
then69_end:
  br label %endif69
else69:
  br label %else69_end
else69_end:
  br label %endif69
endif69:
  %t1600 = phi i64 [ %t1599, %then69_end ], [ 0, %else69_end ]
  %t1601 = load i64, ptr %local.num_k
  %t1602 = icmp sgt i64 %t1601, 4
  %t1603 = zext i1 %t1602 to i64
  %t1604 = icmp ne i64 %t1603, 0
  br i1 %t1604, label %then71, label %else71
then71:
  %t1605 = load i64, ptr %local.rng.1330
  %t1606 = call i64 @"lcg_next"(i64 %t1605)
  store i64 %t1606, ptr %local.rng.1330
  %t1607 = load i64, ptr %local.alpha
  %t1608 = load i64, ptr %local.avg_mean.1332
  %t1609 = load i64, ptr %local.a4.1318
  %t1610 = load i64, ptr %local.b4.1319
  %t1611 = call i64 @"beta_mean"(i64 %t1609, i64 %t1610)
  %t1612 = call i64 @"sx_f64_sub"(i64 %t1608, i64 %t1611)
  %t1613 = call i64 @"sx_f64_mul"(i64 %t1607, i64 %t1612)
  %t1614 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.263)
  %t1615 = call i64 @"sx_f64_mul"(i64 %t1613, i64 %t1614)
  store i64 %t1615, ptr %local.boost.1333
  %t1616 = load i64, ptr %local.rng.1330
  %t1617 = call i64 @"lcg_f64"(i64 %t1616)
  %t1618 = call i64 @"get_true_val"(i64 4)
  %t1619 = icmp slt i64 %t1617, %t1618
  %t1620 = zext i1 %t1619 to i64
  %t1621 = icmp ne i64 %t1620, 0
  br i1 %t1621, label %then72, label %else72
then72:
  %t1622 = load i64, ptr %local.a4.1318
  %t1623 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.264)
  %t1624 = call i64 @"sx_f64_add"(i64 %t1622, i64 %t1623)
  %t1625 = load i64, ptr %local.boost.1333
  %t1626 = call i64 @"sx_f64_add"(i64 %t1624, i64 %t1625)
  store i64 %t1626, ptr %local.a4.1318
  br label %then72_end
then72_end:
  br label %endif72
else72:
  %t1627 = load i64, ptr %local.b4.1319
  %t1628 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.265)
  %t1629 = call i64 @"sx_f64_add"(i64 %t1627, i64 %t1628)
  %t1630 = load i64, ptr %local.boost.1333
  %t1631 = call i64 @"sx_f64_sub"(i64 %t1629, i64 %t1630)
  store i64 %t1631, ptr %local.b4.1319
  br label %else72_end
else72_end:
  br label %endif72
endif72:
  %t1632 = phi i64 [ 0, %then72_end ], [ 0, %else72_end ]
  br label %then71_end
then71_end:
  br label %endif71
else71:
  br label %else71_end
else71_end:
  br label %endif71
endif71:
  %t1633 = phi i64 [ %t1632, %then71_end ], [ 0, %else71_end ]
  %t1634 = load i64, ptr %local.num_k
  %t1635 = icmp sgt i64 %t1634, 5
  %t1636 = zext i1 %t1635 to i64
  %t1637 = icmp ne i64 %t1636, 0
  br i1 %t1637, label %then73, label %else73
then73:
  %t1638 = load i64, ptr %local.rng.1330
  %t1639 = call i64 @"lcg_next"(i64 %t1638)
  store i64 %t1639, ptr %local.rng.1330
  %t1640 = load i64, ptr %local.alpha
  %t1641 = load i64, ptr %local.avg_mean.1332
  %t1642 = load i64, ptr %local.a5.1320
  %t1643 = load i64, ptr %local.b5.1321
  %t1644 = call i64 @"beta_mean"(i64 %t1642, i64 %t1643)
  %t1645 = call i64 @"sx_f64_sub"(i64 %t1641, i64 %t1644)
  %t1646 = call i64 @"sx_f64_mul"(i64 %t1640, i64 %t1645)
  %t1647 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.266)
  %t1648 = call i64 @"sx_f64_mul"(i64 %t1646, i64 %t1647)
  store i64 %t1648, ptr %local.boost.1333
  %t1649 = load i64, ptr %local.rng.1330
  %t1650 = call i64 @"lcg_f64"(i64 %t1649)
  %t1651 = call i64 @"get_true_val"(i64 5)
  %t1652 = icmp slt i64 %t1650, %t1651
  %t1653 = zext i1 %t1652 to i64
  %t1654 = icmp ne i64 %t1653, 0
  br i1 %t1654, label %then74, label %else74
then74:
  %t1655 = load i64, ptr %local.a5.1320
  %t1656 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.267)
  %t1657 = call i64 @"sx_f64_add"(i64 %t1655, i64 %t1656)
  %t1658 = load i64, ptr %local.boost.1333
  %t1659 = call i64 @"sx_f64_add"(i64 %t1657, i64 %t1658)
  store i64 %t1659, ptr %local.a5.1320
  br label %then74_end
then74_end:
  br label %endif74
else74:
  %t1660 = load i64, ptr %local.b5.1321
  %t1661 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.268)
  %t1662 = call i64 @"sx_f64_add"(i64 %t1660, i64 %t1661)
  %t1663 = load i64, ptr %local.boost.1333
  %t1664 = call i64 @"sx_f64_sub"(i64 %t1662, i64 %t1663)
  store i64 %t1664, ptr %local.b5.1321
  br label %else74_end
else74_end:
  br label %endif74
endif74:
  %t1665 = phi i64 [ 0, %then74_end ], [ 0, %else74_end ]
  br label %then73_end
then73_end:
  br label %endif73
else73:
  br label %else73_end
else73_end:
  br label %endif73
endif73:
  %t1666 = phi i64 [ %t1665, %then73_end ], [ 0, %else73_end ]
  %t1667 = load i64, ptr %local.num_k
  %t1668 = icmp sgt i64 %t1667, 6
  %t1669 = zext i1 %t1668 to i64
  %t1670 = icmp ne i64 %t1669, 0
  br i1 %t1670, label %then75, label %else75
then75:
  %t1671 = load i64, ptr %local.rng.1330
  %t1672 = call i64 @"lcg_next"(i64 %t1671)
  store i64 %t1672, ptr %local.rng.1330
  %t1673 = load i64, ptr %local.alpha
  %t1674 = load i64, ptr %local.avg_mean.1332
  %t1675 = load i64, ptr %local.a6.1322
  %t1676 = load i64, ptr %local.b6.1323
  %t1677 = call i64 @"beta_mean"(i64 %t1675, i64 %t1676)
  %t1678 = call i64 @"sx_f64_sub"(i64 %t1674, i64 %t1677)
  %t1679 = call i64 @"sx_f64_mul"(i64 %t1673, i64 %t1678)
  %t1680 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.269)
  %t1681 = call i64 @"sx_f64_mul"(i64 %t1679, i64 %t1680)
  store i64 %t1681, ptr %local.boost.1333
  %t1682 = load i64, ptr %local.rng.1330
  %t1683 = call i64 @"lcg_f64"(i64 %t1682)
  %t1684 = call i64 @"get_true_val"(i64 6)
  %t1685 = icmp slt i64 %t1683, %t1684
  %t1686 = zext i1 %t1685 to i64
  %t1687 = icmp ne i64 %t1686, 0
  br i1 %t1687, label %then76, label %else76
then76:
  %t1688 = load i64, ptr %local.a6.1322
  %t1689 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.270)
  %t1690 = call i64 @"sx_f64_add"(i64 %t1688, i64 %t1689)
  %t1691 = load i64, ptr %local.boost.1333
  %t1692 = call i64 @"sx_f64_add"(i64 %t1690, i64 %t1691)
  store i64 %t1692, ptr %local.a6.1322
  br label %then76_end
then76_end:
  br label %endif76
else76:
  %t1693 = load i64, ptr %local.b6.1323
  %t1694 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.271)
  %t1695 = call i64 @"sx_f64_add"(i64 %t1693, i64 %t1694)
  %t1696 = load i64, ptr %local.boost.1333
  %t1697 = call i64 @"sx_f64_sub"(i64 %t1695, i64 %t1696)
  store i64 %t1697, ptr %local.b6.1323
  br label %else76_end
else76_end:
  br label %endif76
endif76:
  %t1698 = phi i64 [ 0, %then76_end ], [ 0, %else76_end ]
  br label %then75_end
then75_end:
  br label %endif75
else75:
  br label %else75_end
else75_end:
  br label %endif75
endif75:
  %t1699 = phi i64 [ %t1698, %then75_end ], [ 0, %else75_end ]
  %t1700 = load i64, ptr %local.num_k
  %t1701 = icmp sgt i64 %t1700, 7
  %t1702 = zext i1 %t1701 to i64
  %t1703 = icmp ne i64 %t1702, 0
  br i1 %t1703, label %then77, label %else77
then77:
  %t1704 = load i64, ptr %local.rng.1330
  %t1705 = call i64 @"lcg_next"(i64 %t1704)
  store i64 %t1705, ptr %local.rng.1330
  %t1706 = load i64, ptr %local.alpha
  %t1707 = load i64, ptr %local.avg_mean.1332
  %t1708 = load i64, ptr %local.a7.1324
  %t1709 = load i64, ptr %local.b7.1325
  %t1710 = call i64 @"beta_mean"(i64 %t1708, i64 %t1709)
  %t1711 = call i64 @"sx_f64_sub"(i64 %t1707, i64 %t1710)
  %t1712 = call i64 @"sx_f64_mul"(i64 %t1706, i64 %t1711)
  %t1713 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.272)
  %t1714 = call i64 @"sx_f64_mul"(i64 %t1712, i64 %t1713)
  store i64 %t1714, ptr %local.boost.1333
  %t1715 = load i64, ptr %local.rng.1330
  %t1716 = call i64 @"lcg_f64"(i64 %t1715)
  %t1717 = call i64 @"get_true_val"(i64 7)
  %t1718 = icmp slt i64 %t1716, %t1717
  %t1719 = zext i1 %t1718 to i64
  %t1720 = icmp ne i64 %t1719, 0
  br i1 %t1720, label %then78, label %else78
then78:
  %t1721 = load i64, ptr %local.a7.1324
  %t1722 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.273)
  %t1723 = call i64 @"sx_f64_add"(i64 %t1721, i64 %t1722)
  %t1724 = load i64, ptr %local.boost.1333
  %t1725 = call i64 @"sx_f64_add"(i64 %t1723, i64 %t1724)
  store i64 %t1725, ptr %local.a7.1324
  br label %then78_end
then78_end:
  br label %endif78
else78:
  %t1726 = load i64, ptr %local.b7.1325
  %t1727 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.274)
  %t1728 = call i64 @"sx_f64_add"(i64 %t1726, i64 %t1727)
  %t1729 = load i64, ptr %local.boost.1333
  %t1730 = call i64 @"sx_f64_sub"(i64 %t1728, i64 %t1729)
  store i64 %t1730, ptr %local.b7.1325
  br label %else78_end
else78_end:
  br label %endif78
endif78:
  %t1731 = phi i64 [ 0, %then78_end ], [ 0, %else78_end ]
  br label %then77_end
then77_end:
  br label %endif77
else77:
  br label %else77_end
else77_end:
  br label %endif77
endif77:
  %t1732 = phi i64 [ %t1731, %then77_end ], [ 0, %else77_end ]
  %t1733 = load i64, ptr %local.num_k
  %t1734 = icmp sgt i64 %t1733, 8
  %t1735 = zext i1 %t1734 to i64
  %t1736 = icmp ne i64 %t1735, 0
  br i1 %t1736, label %then79, label %else79
then79:
  %t1737 = load i64, ptr %local.rng.1330
  %t1738 = call i64 @"lcg_next"(i64 %t1737)
  store i64 %t1738, ptr %local.rng.1330
  %t1739 = load i64, ptr %local.alpha
  %t1740 = load i64, ptr %local.avg_mean.1332
  %t1741 = load i64, ptr %local.a8.1326
  %t1742 = load i64, ptr %local.b8.1327
  %t1743 = call i64 @"beta_mean"(i64 %t1741, i64 %t1742)
  %t1744 = call i64 @"sx_f64_sub"(i64 %t1740, i64 %t1743)
  %t1745 = call i64 @"sx_f64_mul"(i64 %t1739, i64 %t1744)
  %t1746 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.275)
  %t1747 = call i64 @"sx_f64_mul"(i64 %t1745, i64 %t1746)
  store i64 %t1747, ptr %local.boost.1333
  %t1748 = load i64, ptr %local.rng.1330
  %t1749 = call i64 @"lcg_f64"(i64 %t1748)
  %t1750 = call i64 @"get_true_val"(i64 8)
  %t1751 = icmp slt i64 %t1749, %t1750
  %t1752 = zext i1 %t1751 to i64
  %t1753 = icmp ne i64 %t1752, 0
  br i1 %t1753, label %then80, label %else80
then80:
  %t1754 = load i64, ptr %local.a8.1326
  %t1755 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.276)
  %t1756 = call i64 @"sx_f64_add"(i64 %t1754, i64 %t1755)
  %t1757 = load i64, ptr %local.boost.1333
  %t1758 = call i64 @"sx_f64_add"(i64 %t1756, i64 %t1757)
  store i64 %t1758, ptr %local.a8.1326
  br label %then80_end
then80_end:
  br label %endif80
else80:
  %t1759 = load i64, ptr %local.b8.1327
  %t1760 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.277)
  %t1761 = call i64 @"sx_f64_add"(i64 %t1759, i64 %t1760)
  %t1762 = load i64, ptr %local.boost.1333
  %t1763 = call i64 @"sx_f64_sub"(i64 %t1761, i64 %t1762)
  store i64 %t1763, ptr %local.b8.1327
  br label %else80_end
else80_end:
  br label %endif80
endif80:
  %t1764 = phi i64 [ 0, %then80_end ], [ 0, %else80_end ]
  br label %then79_end
then79_end:
  br label %endif79
else79:
  br label %else79_end
else79_end:
  br label %endif79
endif79:
  %t1765 = phi i64 [ %t1764, %then79_end ], [ 0, %else79_end ]
  %t1766 = load i64, ptr %local.num_k
  %t1767 = icmp sgt i64 %t1766, 9
  %t1768 = zext i1 %t1767 to i64
  %t1769 = icmp ne i64 %t1768, 0
  br i1 %t1769, label %then81, label %else81
then81:
  %t1770 = load i64, ptr %local.rng.1330
  %t1771 = call i64 @"lcg_next"(i64 %t1770)
  store i64 %t1771, ptr %local.rng.1330
  %t1772 = load i64, ptr %local.alpha
  %t1773 = load i64, ptr %local.avg_mean.1332
  %t1774 = load i64, ptr %local.a9.1328
  %t1775 = load i64, ptr %local.b9.1329
  %t1776 = call i64 @"beta_mean"(i64 %t1774, i64 %t1775)
  %t1777 = call i64 @"sx_f64_sub"(i64 %t1773, i64 %t1776)
  %t1778 = call i64 @"sx_f64_mul"(i64 %t1772, i64 %t1777)
  %t1779 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.278)
  %t1780 = call i64 @"sx_f64_mul"(i64 %t1778, i64 %t1779)
  store i64 %t1780, ptr %local.boost.1333
  %t1781 = load i64, ptr %local.rng.1330
  %t1782 = call i64 @"lcg_f64"(i64 %t1781)
  %t1783 = call i64 @"get_true_val"(i64 9)
  %t1784 = icmp slt i64 %t1782, %t1783
  %t1785 = zext i1 %t1784 to i64
  %t1786 = icmp ne i64 %t1785, 0
  br i1 %t1786, label %then82, label %else82
then82:
  %t1787 = load i64, ptr %local.a9.1328
  %t1788 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.279)
  %t1789 = call i64 @"sx_f64_add"(i64 %t1787, i64 %t1788)
  %t1790 = load i64, ptr %local.boost.1333
  %t1791 = call i64 @"sx_f64_add"(i64 %t1789, i64 %t1790)
  store i64 %t1791, ptr %local.a9.1328
  br label %then82_end
then82_end:
  br label %endif82
else82:
  %t1792 = load i64, ptr %local.b9.1329
  %t1793 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.280)
  %t1794 = call i64 @"sx_f64_add"(i64 %t1792, i64 %t1793)
  %t1795 = load i64, ptr %local.boost.1333
  %t1796 = call i64 @"sx_f64_sub"(i64 %t1794, i64 %t1795)
  store i64 %t1796, ptr %local.b9.1329
  br label %else82_end
else82_end:
  br label %endif82
endif82:
  %t1797 = phi i64 [ 0, %then82_end ], [ 0, %else82_end ]
  br label %then81_end
then81_end:
  br label %endif81
else81:
  br label %else81_end
else81_end:
  br label %endif81
endif81:
  %t1798 = phi i64 [ %t1797, %then81_end ], [ 0, %else81_end ]
  %t1799 = load i64, ptr %local.step.1331
  %t1800 = add i64 %t1799, 1
  store i64 %t1800, ptr %local.step.1331
  br label %loop52
endloop52:
  %t1801 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.281)
  store i64 %t1801, ptr %local.total_err.1334
  %t1802 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.282)
  store i64 %t1802, ptr %local.err.1335
  %t1803 = load i64, ptr %local.num_k
  %t1804 = icmp sgt i64 %t1803, 0
  %t1805 = zext i1 %t1804 to i64
  %t1806 = icmp ne i64 %t1805, 0
  br i1 %t1806, label %then83, label %else83
then83:
  %t1807 = load i64, ptr %local.a0.1310
  %t1808 = load i64, ptr %local.b0.1311
  %t1809 = call i64 @"beta_mean"(i64 %t1807, i64 %t1808)
  %t1810 = call i64 @"get_true_val"(i64 0)
  %t1811 = call i64 @"sx_f64_sub"(i64 %t1809, i64 %t1810)
  store i64 %t1811, ptr %local.err.1335
  %t1812 = load i64, ptr %local.total_err.1334
  %t1813 = load i64, ptr %local.err.1335
  %t1814 = load i64, ptr %local.err.1335
  %t1815 = call i64 @"sx_f64_mul"(i64 %t1813, i64 %t1814)
  %t1816 = call i64 @"sx_f64_add"(i64 %t1812, i64 %t1815)
  store i64 %t1816, ptr %local.total_err.1334
  br label %then83_end
then83_end:
  br label %endif83
else83:
  br label %else83_end
else83_end:
  br label %endif83
endif83:
  %t1817 = phi i64 [ 0, %then83_end ], [ 0, %else83_end ]
  %t1818 = load i64, ptr %local.num_k
  %t1819 = icmp sgt i64 %t1818, 1
  %t1820 = zext i1 %t1819 to i64
  %t1821 = icmp ne i64 %t1820, 0
  br i1 %t1821, label %then84, label %else84
then84:
  %t1822 = load i64, ptr %local.a1.1312
  %t1823 = load i64, ptr %local.b1.1313
  %t1824 = call i64 @"beta_mean"(i64 %t1822, i64 %t1823)
  %t1825 = call i64 @"get_true_val"(i64 1)
  %t1826 = call i64 @"sx_f64_sub"(i64 %t1824, i64 %t1825)
  store i64 %t1826, ptr %local.err.1335
  %t1827 = load i64, ptr %local.total_err.1334
  %t1828 = load i64, ptr %local.err.1335
  %t1829 = load i64, ptr %local.err.1335
  %t1830 = call i64 @"sx_f64_mul"(i64 %t1828, i64 %t1829)
  %t1831 = call i64 @"sx_f64_add"(i64 %t1827, i64 %t1830)
  store i64 %t1831, ptr %local.total_err.1334
  br label %then84_end
then84_end:
  br label %endif84
else84:
  br label %else84_end
else84_end:
  br label %endif84
endif84:
  %t1832 = phi i64 [ 0, %then84_end ], [ 0, %else84_end ]
  %t1833 = load i64, ptr %local.num_k
  %t1834 = icmp sgt i64 %t1833, 2
  %t1835 = zext i1 %t1834 to i64
  %t1836 = icmp ne i64 %t1835, 0
  br i1 %t1836, label %then85, label %else85
then85:
  %t1837 = load i64, ptr %local.a2.1314
  %t1838 = load i64, ptr %local.b2.1315
  %t1839 = call i64 @"beta_mean"(i64 %t1837, i64 %t1838)
  %t1840 = call i64 @"get_true_val"(i64 2)
  %t1841 = call i64 @"sx_f64_sub"(i64 %t1839, i64 %t1840)
  store i64 %t1841, ptr %local.err.1335
  %t1842 = load i64, ptr %local.total_err.1334
  %t1843 = load i64, ptr %local.err.1335
  %t1844 = load i64, ptr %local.err.1335
  %t1845 = call i64 @"sx_f64_mul"(i64 %t1843, i64 %t1844)
  %t1846 = call i64 @"sx_f64_add"(i64 %t1842, i64 %t1845)
  store i64 %t1846, ptr %local.total_err.1334
  br label %then85_end
then85_end:
  br label %endif85
else85:
  br label %else85_end
else85_end:
  br label %endif85
endif85:
  %t1847 = phi i64 [ 0, %then85_end ], [ 0, %else85_end ]
  %t1848 = load i64, ptr %local.num_k
  %t1849 = icmp sgt i64 %t1848, 3
  %t1850 = zext i1 %t1849 to i64
  %t1851 = icmp ne i64 %t1850, 0
  br i1 %t1851, label %then86, label %else86
then86:
  %t1852 = load i64, ptr %local.a3.1316
  %t1853 = load i64, ptr %local.b3.1317
  %t1854 = call i64 @"beta_mean"(i64 %t1852, i64 %t1853)
  %t1855 = call i64 @"get_true_val"(i64 3)
  %t1856 = call i64 @"sx_f64_sub"(i64 %t1854, i64 %t1855)
  store i64 %t1856, ptr %local.err.1335
  %t1857 = load i64, ptr %local.total_err.1334
  %t1858 = load i64, ptr %local.err.1335
  %t1859 = load i64, ptr %local.err.1335
  %t1860 = call i64 @"sx_f64_mul"(i64 %t1858, i64 %t1859)
  %t1861 = call i64 @"sx_f64_add"(i64 %t1857, i64 %t1860)
  store i64 %t1861, ptr %local.total_err.1334
  br label %then86_end
then86_end:
  br label %endif86
else86:
  br label %else86_end
else86_end:
  br label %endif86
endif86:
  %t1862 = phi i64 [ 0, %then86_end ], [ 0, %else86_end ]
  %t1863 = load i64, ptr %local.num_k
  %t1864 = icmp sgt i64 %t1863, 4
  %t1865 = zext i1 %t1864 to i64
  %t1866 = icmp ne i64 %t1865, 0
  br i1 %t1866, label %then87, label %else87
then87:
  %t1867 = load i64, ptr %local.a4.1318
  %t1868 = load i64, ptr %local.b4.1319
  %t1869 = call i64 @"beta_mean"(i64 %t1867, i64 %t1868)
  %t1870 = call i64 @"get_true_val"(i64 4)
  %t1871 = call i64 @"sx_f64_sub"(i64 %t1869, i64 %t1870)
  store i64 %t1871, ptr %local.err.1335
  %t1872 = load i64, ptr %local.total_err.1334
  %t1873 = load i64, ptr %local.err.1335
  %t1874 = load i64, ptr %local.err.1335
  %t1875 = call i64 @"sx_f64_mul"(i64 %t1873, i64 %t1874)
  %t1876 = call i64 @"sx_f64_add"(i64 %t1872, i64 %t1875)
  store i64 %t1876, ptr %local.total_err.1334
  br label %then87_end
then87_end:
  br label %endif87
else87:
  br label %else87_end
else87_end:
  br label %endif87
endif87:
  %t1877 = phi i64 [ 0, %then87_end ], [ 0, %else87_end ]
  %t1878 = load i64, ptr %local.num_k
  %t1879 = icmp sgt i64 %t1878, 5
  %t1880 = zext i1 %t1879 to i64
  %t1881 = icmp ne i64 %t1880, 0
  br i1 %t1881, label %then88, label %else88
then88:
  %t1882 = load i64, ptr %local.a5.1320
  %t1883 = load i64, ptr %local.b5.1321
  %t1884 = call i64 @"beta_mean"(i64 %t1882, i64 %t1883)
  %t1885 = call i64 @"get_true_val"(i64 5)
  %t1886 = call i64 @"sx_f64_sub"(i64 %t1884, i64 %t1885)
  store i64 %t1886, ptr %local.err.1335
  %t1887 = load i64, ptr %local.total_err.1334
  %t1888 = load i64, ptr %local.err.1335
  %t1889 = load i64, ptr %local.err.1335
  %t1890 = call i64 @"sx_f64_mul"(i64 %t1888, i64 %t1889)
  %t1891 = call i64 @"sx_f64_add"(i64 %t1887, i64 %t1890)
  store i64 %t1891, ptr %local.total_err.1334
  br label %then88_end
then88_end:
  br label %endif88
else88:
  br label %else88_end
else88_end:
  br label %endif88
endif88:
  %t1892 = phi i64 [ 0, %then88_end ], [ 0, %else88_end ]
  %t1893 = load i64, ptr %local.num_k
  %t1894 = icmp sgt i64 %t1893, 6
  %t1895 = zext i1 %t1894 to i64
  %t1896 = icmp ne i64 %t1895, 0
  br i1 %t1896, label %then89, label %else89
then89:
  %t1897 = load i64, ptr %local.a6.1322
  %t1898 = load i64, ptr %local.b6.1323
  %t1899 = call i64 @"beta_mean"(i64 %t1897, i64 %t1898)
  %t1900 = call i64 @"get_true_val"(i64 6)
  %t1901 = call i64 @"sx_f64_sub"(i64 %t1899, i64 %t1900)
  store i64 %t1901, ptr %local.err.1335
  %t1902 = load i64, ptr %local.total_err.1334
  %t1903 = load i64, ptr %local.err.1335
  %t1904 = load i64, ptr %local.err.1335
  %t1905 = call i64 @"sx_f64_mul"(i64 %t1903, i64 %t1904)
  %t1906 = call i64 @"sx_f64_add"(i64 %t1902, i64 %t1905)
  store i64 %t1906, ptr %local.total_err.1334
  br label %then89_end
then89_end:
  br label %endif89
else89:
  br label %else89_end
else89_end:
  br label %endif89
endif89:
  %t1907 = phi i64 [ 0, %then89_end ], [ 0, %else89_end ]
  %t1908 = load i64, ptr %local.num_k
  %t1909 = icmp sgt i64 %t1908, 7
  %t1910 = zext i1 %t1909 to i64
  %t1911 = icmp ne i64 %t1910, 0
  br i1 %t1911, label %then90, label %else90
then90:
  %t1912 = load i64, ptr %local.a7.1324
  %t1913 = load i64, ptr %local.b7.1325
  %t1914 = call i64 @"beta_mean"(i64 %t1912, i64 %t1913)
  %t1915 = call i64 @"get_true_val"(i64 7)
  %t1916 = call i64 @"sx_f64_sub"(i64 %t1914, i64 %t1915)
  store i64 %t1916, ptr %local.err.1335
  %t1917 = load i64, ptr %local.total_err.1334
  %t1918 = load i64, ptr %local.err.1335
  %t1919 = load i64, ptr %local.err.1335
  %t1920 = call i64 @"sx_f64_mul"(i64 %t1918, i64 %t1919)
  %t1921 = call i64 @"sx_f64_add"(i64 %t1917, i64 %t1920)
  store i64 %t1921, ptr %local.total_err.1334
  br label %then90_end
then90_end:
  br label %endif90
else90:
  br label %else90_end
else90_end:
  br label %endif90
endif90:
  %t1922 = phi i64 [ 0, %then90_end ], [ 0, %else90_end ]
  %t1923 = load i64, ptr %local.num_k
  %t1924 = icmp sgt i64 %t1923, 8
  %t1925 = zext i1 %t1924 to i64
  %t1926 = icmp ne i64 %t1925, 0
  br i1 %t1926, label %then91, label %else91
then91:
  %t1927 = load i64, ptr %local.a8.1326
  %t1928 = load i64, ptr %local.b8.1327
  %t1929 = call i64 @"beta_mean"(i64 %t1927, i64 %t1928)
  %t1930 = call i64 @"get_true_val"(i64 8)
  %t1931 = call i64 @"sx_f64_sub"(i64 %t1929, i64 %t1930)
  store i64 %t1931, ptr %local.err.1335
  %t1932 = load i64, ptr %local.total_err.1334
  %t1933 = load i64, ptr %local.err.1335
  %t1934 = load i64, ptr %local.err.1335
  %t1935 = call i64 @"sx_f64_mul"(i64 %t1933, i64 %t1934)
  %t1936 = call i64 @"sx_f64_add"(i64 %t1932, i64 %t1935)
  store i64 %t1936, ptr %local.total_err.1334
  br label %then91_end
then91_end:
  br label %endif91
else91:
  br label %else91_end
else91_end:
  br label %endif91
endif91:
  %t1937 = phi i64 [ 0, %then91_end ], [ 0, %else91_end ]
  %t1938 = load i64, ptr %local.num_k
  %t1939 = icmp sgt i64 %t1938, 9
  %t1940 = zext i1 %t1939 to i64
  %t1941 = icmp ne i64 %t1940, 0
  br i1 %t1941, label %then92, label %else92
then92:
  %t1942 = load i64, ptr %local.a9.1328
  %t1943 = load i64, ptr %local.b9.1329
  %t1944 = call i64 @"beta_mean"(i64 %t1942, i64 %t1943)
  %t1945 = call i64 @"get_true_val"(i64 9)
  %t1946 = call i64 @"sx_f64_sub"(i64 %t1944, i64 %t1945)
  store i64 %t1946, ptr %local.err.1335
  %t1947 = load i64, ptr %local.total_err.1334
  %t1948 = load i64, ptr %local.err.1335
  %t1949 = load i64, ptr %local.err.1335
  %t1950 = call i64 @"sx_f64_mul"(i64 %t1948, i64 %t1949)
  %t1951 = call i64 @"sx_f64_add"(i64 %t1947, i64 %t1950)
  store i64 %t1951, ptr %local.total_err.1334
  br label %then92_end
then92_end:
  br label %endif92
else92:
  br label %else92_end
else92_end:
  br label %endif92
endif92:
  %t1952 = phi i64 [ 0, %then92_end ], [ 0, %else92_end ]
  %t1953 = load i64, ptr %local.total_err.1334
  %t1954 = load i64, ptr %local.num_k
  %t1955 = call i64 @"sx_int_to_f64"(i64 %t1954)
  %t1956 = call i64 @"sx_f64_div"(i64 %t1953, i64 %t1955)
  ret i64 %t1956
}

define i64 @"avg_k_beliefs"(i64 %num_k, i64 %alpha, i64 %obs) nounwind {
entry:
  %local.l1.1957 = alloca i64
  %local.l2.1958 = alloca i64
  %local.l3.1959 = alloca i64
  %local.l4.1960 = alloca i64
  %local.num_k = alloca i64
  store i64 %num_k, ptr %local.num_k
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.obs = alloca i64
  store i64 %obs, ptr %local.obs
  %t1961 = load i64, ptr %local.num_k
  %t1962 = load i64, ptr %local.alpha
  %t1963 = load i64, ptr %local.obs
  %t1964 = call i64 @"train_k_beliefs"(i64 %t1961, i64 %t1962, i64 %t1963, i64 42)
  store i64 %t1964, ptr %local.l1.1957
  %t1965 = load i64, ptr %local.num_k
  %t1966 = load i64, ptr %local.alpha
  %t1967 = load i64, ptr %local.obs
  %t1968 = call i64 @"train_k_beliefs"(i64 %t1965, i64 %t1966, i64 %t1967, i64 137)
  store i64 %t1968, ptr %local.l2.1958
  %t1969 = load i64, ptr %local.num_k
  %t1970 = load i64, ptr %local.alpha
  %t1971 = load i64, ptr %local.obs
  %t1972 = call i64 @"train_k_beliefs"(i64 %t1969, i64 %t1970, i64 %t1971, i64 999)
  store i64 %t1972, ptr %local.l3.1959
  %t1973 = load i64, ptr %local.num_k
  %t1974 = load i64, ptr %local.alpha
  %t1975 = load i64, ptr %local.obs
  %t1976 = call i64 @"train_k_beliefs"(i64 %t1973, i64 %t1974, i64 %t1975, i64 2023)
  store i64 %t1976, ptr %local.l4.1960
  %t1977 = load i64, ptr %local.l1.1957
  %t1978 = load i64, ptr %local.l2.1958
  %t1979 = call i64 @"sx_f64_add"(i64 %t1977, i64 %t1978)
  %t1980 = load i64, ptr %local.l3.1959
  %t1981 = call i64 @"sx_f64_add"(i64 %t1979, i64 %t1980)
  %t1982 = load i64, ptr %local.l4.1960
  %t1983 = call i64 @"sx_f64_add"(i64 %t1981, i64 %t1982)
  %t1984 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.283)
  %t1985 = call i64 @"sx_f64_div"(i64 %t1983, i64 %t1984)
  ret i64 %t1985
}

define i64 @"run_exp4"() nounwind {
entry:
  %local.obs.1986 = alloca i64
  %local.alpha.1987 = alloca i64
  %local.prev_coupled.1988 = alloca i64
  %local.max_jump.1989 = alloca i64
  %local.jump_k.1990 = alloca i64
  %local.ki.1991 = alloca i64
  %local.k.1992 = alloca i64
  %local.indep.1993 = alloca i64
  %local.coupled.1994 = alloca i64
  %local.ratio.1995 = alloca i64
  %local.jump.1996 = alloca i64
  %local.ai.1997 = alloca i64
  %local.a.1998 = alloca i64
  %local.mse.1999 = alloca i64
  %t2000 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.284)
  %t2001 = ptrtoint ptr %t2000 to i64
  %t2002 = inttoptr i64 %t2001 to ptr
  call void @intrinsic_println(ptr %t2002)
  %t2003 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.285)
  %t2004 = ptrtoint ptr %t2003 to i64
  %t2005 = inttoptr i64 %t2004 to ptr
  call void @intrinsic_println(ptr %t2005)
  %t2006 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.286)
  %t2007 = ptrtoint ptr %t2006 to i64
  %t2008 = inttoptr i64 %t2007 to ptr
  call void @intrinsic_println(ptr %t2008)
  %t2009 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.287)
  %t2010 = ptrtoint ptr %t2009 to i64
  %t2011 = inttoptr i64 %t2010 to ptr
  call void @intrinsic_println(ptr %t2011)
  store i64 150, ptr %local.obs.1986
  %t2012 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.288)
  store i64 %t2012, ptr %local.alpha.1987
  %t2013 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.289)
  %t2014 = ptrtoint ptr %t2013 to i64
  %t2015 = inttoptr i64 %t2014 to ptr
  call void @intrinsic_println(ptr %t2015)
  %t2016 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.290)
  %t2017 = ptrtoint ptr %t2016 to i64
  %t2018 = inttoptr i64 %t2017 to ptr
  call void @intrinsic_println(ptr %t2018)
  %t2019 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.291)
  store i64 %t2019, ptr %local.prev_coupled.1988
  %t2020 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.292)
  store i64 %t2020, ptr %local.max_jump.1989
  store i64 0, ptr %local.jump_k.1990
  store i64 0, ptr %local.ki.1991
  br label %loop93
loop93:
  %t2021 = load i64, ptr %local.ki.1991
  %t2022 = icmp slt i64 %t2021, 7
  %t2023 = zext i1 %t2022 to i64
  %t2024 = icmp ne i64 %t2023, 0
  br i1 %t2024, label %body93, label %endloop93
body93:
  store i64 0, ptr %local.k.1992
  %t2025 = load i64, ptr %local.ki.1991
  %t2026 = icmp eq i64 %t2025, 0
  %t2027 = zext i1 %t2026 to i64
  %t2028 = icmp ne i64 %t2027, 0
  br i1 %t2028, label %then94, label %else94
then94:
  store i64 2, ptr %local.k.1992
  br label %then94_end
then94_end:
  br label %endif94
else94:
  br label %else94_end
else94_end:
  br label %endif94
endif94:
  %t2029 = phi i64 [ 0, %then94_end ], [ 0, %else94_end ]
  %t2030 = load i64, ptr %local.ki.1991
  %t2031 = icmp eq i64 %t2030, 1
  %t2032 = zext i1 %t2031 to i64
  %t2033 = icmp ne i64 %t2032, 0
  br i1 %t2033, label %then95, label %else95
then95:
  store i64 3, ptr %local.k.1992
  br label %then95_end
then95_end:
  br label %endif95
else95:
  br label %else95_end
else95_end:
  br label %endif95
endif95:
  %t2034 = phi i64 [ 0, %then95_end ], [ 0, %else95_end ]
  %t2035 = load i64, ptr %local.ki.1991
  %t2036 = icmp eq i64 %t2035, 2
  %t2037 = zext i1 %t2036 to i64
  %t2038 = icmp ne i64 %t2037, 0
  br i1 %t2038, label %then96, label %else96
then96:
  store i64 4, ptr %local.k.1992
  br label %then96_end
then96_end:
  br label %endif96
else96:
  br label %else96_end
else96_end:
  br label %endif96
endif96:
  %t2039 = phi i64 [ 0, %then96_end ], [ 0, %else96_end ]
  %t2040 = load i64, ptr %local.ki.1991
  %t2041 = icmp eq i64 %t2040, 3
  %t2042 = zext i1 %t2041 to i64
  %t2043 = icmp ne i64 %t2042, 0
  br i1 %t2043, label %then97, label %else97
then97:
  store i64 5, ptr %local.k.1992
  br label %then97_end
then97_end:
  br label %endif97
else97:
  br label %else97_end
else97_end:
  br label %endif97
endif97:
  %t2044 = phi i64 [ 0, %then97_end ], [ 0, %else97_end ]
  %t2045 = load i64, ptr %local.ki.1991
  %t2046 = icmp eq i64 %t2045, 4
  %t2047 = zext i1 %t2046 to i64
  %t2048 = icmp ne i64 %t2047, 0
  br i1 %t2048, label %then98, label %else98
then98:
  store i64 6, ptr %local.k.1992
  br label %then98_end
then98_end:
  br label %endif98
else98:
  br label %else98_end
else98_end:
  br label %endif98
endif98:
  %t2049 = phi i64 [ 0, %then98_end ], [ 0, %else98_end ]
  %t2050 = load i64, ptr %local.ki.1991
  %t2051 = icmp eq i64 %t2050, 5
  %t2052 = zext i1 %t2051 to i64
  %t2053 = icmp ne i64 %t2052, 0
  br i1 %t2053, label %then99, label %else99
then99:
  store i64 8, ptr %local.k.1992
  br label %then99_end
then99_end:
  br label %endif99
else99:
  br label %else99_end
else99_end:
  br label %endif99
endif99:
  %t2054 = phi i64 [ 0, %then99_end ], [ 0, %else99_end ]
  %t2055 = load i64, ptr %local.ki.1991
  %t2056 = icmp eq i64 %t2055, 6
  %t2057 = zext i1 %t2056 to i64
  %t2058 = icmp ne i64 %t2057, 0
  br i1 %t2058, label %then100, label %else100
then100:
  store i64 10, ptr %local.k.1992
  br label %then100_end
then100_end:
  br label %endif100
else100:
  br label %else100_end
else100_end:
  br label %endif100
endif100:
  %t2059 = phi i64 [ 0, %then100_end ], [ 0, %else100_end ]
  %t2060 = load i64, ptr %local.k.1992
  %t2061 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.293)
  %t2062 = load i64, ptr %local.obs.1986
  %t2063 = call i64 @"avg_k_beliefs"(i64 %t2060, i64 %t2061, i64 %t2062)
  store i64 %t2063, ptr %local.indep.1993
  %t2064 = load i64, ptr %local.k.1992
  %t2065 = load i64, ptr %local.alpha.1987
  %t2066 = load i64, ptr %local.obs.1986
  %t2067 = call i64 @"avg_k_beliefs"(i64 %t2064, i64 %t2065, i64 %t2066)
  store i64 %t2067, ptr %local.coupled.1994
  %t2068 = load i64, ptr %local.coupled.1994
  %t2069 = load i64, ptr %local.indep.1993
  %t2070 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.294)
  %t2071 = call i64 @"sx_f64_add"(i64 %t2069, i64 %t2070)
  %t2072 = call i64 @"sx_f64_div"(i64 %t2068, i64 %t2071)
  store i64 %t2072, ptr %local.ratio.1995
  %t2073 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.295)
  %t2074 = ptrtoint ptr %t2073 to i64
  %t2075 = inttoptr i64 %t2074 to ptr
  call void @intrinsic_print(ptr %t2075)
  %t2076 = load i64, ptr %local.k.1992
  %t2077 = icmp slt i64 %t2076, 10
  %t2078 = zext i1 %t2077 to i64
  %t2079 = icmp ne i64 %t2078, 0
  br i1 %t2079, label %then101, label %else101
then101:
  %t2080 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.296)
  %t2081 = ptrtoint ptr %t2080 to i64
  %t2082 = inttoptr i64 %t2081 to ptr
  call void @intrinsic_print(ptr %t2082)
  br label %then101_end
then101_end:
  br label %endif101
else101:
  br label %else101_end
else101_end:
  br label %endif101
endif101:
  %t2083 = phi i64 [ 0, %then101_end ], [ 0, %else101_end ]
  %t2084 = load i64, ptr %local.k.1992
  %t2085 = call i64 @"sx_int_to_f64"(i64 %t2084)
  %t2086 = call i64 @"print_f64"(i64 %t2085)
  %t2087 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.297)
  %t2088 = ptrtoint ptr %t2087 to i64
  %t2089 = inttoptr i64 %t2088 to ptr
  call void @intrinsic_print(ptr %t2089)
  %t2090 = load i64, ptr %local.indep.1993
  %t2091 = call i64 @"print_f64"(i64 %t2090)
  %t2092 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.298)
  %t2093 = ptrtoint ptr %t2092 to i64
  %t2094 = inttoptr i64 %t2093 to ptr
  call void @intrinsic_print(ptr %t2094)
  %t2095 = load i64, ptr %local.coupled.1994
  %t2096 = call i64 @"print_f64"(i64 %t2095)
  %t2097 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.299)
  %t2098 = ptrtoint ptr %t2097 to i64
  %t2099 = inttoptr i64 %t2098 to ptr
  call void @intrinsic_print(ptr %t2099)
  %t2100 = load i64, ptr %local.ratio.1995
  %t2101 = call i64 @"print_f64"(i64 %t2100)
  %t2102 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.300)
  %t2103 = ptrtoint ptr %t2102 to i64
  %t2104 = inttoptr i64 %t2103 to ptr
  call void @intrinsic_println(ptr %t2104)
  %t2105 = load i64, ptr %local.ki.1991
  %t2106 = icmp sgt i64 %t2105, 0
  %t2107 = zext i1 %t2106 to i64
  %t2108 = icmp ne i64 %t2107, 0
  br i1 %t2108, label %then102, label %else102
then102:
  %t2109 = load i64, ptr %local.coupled.1994
  %t2110 = load i64, ptr %local.prev_coupled.1988
  %t2111 = call i64 @"sx_f64_sub"(i64 %t2109, i64 %t2110)
  store i64 %t2111, ptr %local.jump.1996
  %t2112 = load i64, ptr %local.jump.1996
  %t2113 = load i64, ptr %local.max_jump.1989
  %t2114 = call i64 @"sx_f64_gt"(i64 %t2112, i64 %t2113)
  %t2115 = icmp ne i64 %t2114, 0
  br i1 %t2115, label %then103, label %else103
then103:
  %t2116 = load i64, ptr %local.jump.1996
  store i64 %t2116, ptr %local.max_jump.1989
  %t2117 = load i64, ptr %local.k.1992
  store i64 %t2117, ptr %local.jump_k.1990
  br label %then103_end
then103_end:
  br label %endif103
else103:
  br label %else103_end
else103_end:
  br label %endif103
endif103:
  %t2118 = phi i64 [ 0, %then103_end ], [ 0, %else103_end ]
  br label %then102_end
then102_end:
  br label %endif102
else102:
  br label %else102_end
else102_end:
  br label %endif102
endif102:
  %t2119 = phi i64 [ %t2118, %then102_end ], [ 0, %else102_end ]
  %t2120 = load i64, ptr %local.coupled.1994
  store i64 %t2120, ptr %local.prev_coupled.1988
  %t2121 = load i64, ptr %local.ki.1991
  %t2122 = add i64 %t2121, 1
  store i64 %t2122, ptr %local.ki.1991
  br label %loop93
endloop93:
  %t2123 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.301)
  %t2124 = ptrtoint ptr %t2123 to i64
  %t2125 = inttoptr i64 %t2124 to ptr
  call void @intrinsic_println(ptr %t2125)
  %t2126 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.302)
  %t2127 = ptrtoint ptr %t2126 to i64
  %t2128 = inttoptr i64 %t2127 to ptr
  call void @intrinsic_print(ptr %t2128)
  %t2129 = load i64, ptr %local.jump_k.1990
  %t2130 = call i64 @"sx_int_to_f64"(i64 %t2129)
  %t2131 = call i64 @"print_f64"(i64 %t2130)
  %t2132 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.303)
  %t2133 = ptrtoint ptr %t2132 to i64
  %t2134 = inttoptr i64 %t2133 to ptr
  call void @intrinsic_print(ptr %t2134)
  %t2135 = load i64, ptr %local.max_jump.1989
  %t2136 = call i64 @"print_f64"(i64 %t2135)
  %t2137 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.304)
  %t2138 = ptrtoint ptr %t2137 to i64
  %t2139 = inttoptr i64 %t2138 to ptr
  call void @intrinsic_println(ptr %t2139)
  %t2140 = load i64, ptr %local.max_jump.1989
  %t2141 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.305)
  %t2142 = call i64 @"sx_f64_gt"(i64 %t2140, i64 %t2141)
  %t2143 = icmp ne i64 %t2142, 0
  br i1 %t2143, label %then104, label %else104
then104:
  %t2144 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.306)
  %t2145 = ptrtoint ptr %t2144 to i64
  %t2146 = inttoptr i64 %t2145 to ptr
  call void @intrinsic_println(ptr %t2146)
  br label %then104_end
then104_end:
  br label %endif104
else104:
  br label %else104_end
else104_end:
  br label %endif104
endif104:
  %t2147 = phi i64 [ 0, %then104_end ], [ 0, %else104_end ]
  %t2148 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.307)
  %t2149 = ptrtoint ptr %t2148 to i64
  %t2150 = inttoptr i64 %t2149 to ptr
  call void @intrinsic_println(ptr %t2150)
  %t2151 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.308)
  %t2152 = ptrtoint ptr %t2151 to i64
  %t2153 = inttoptr i64 %t2152 to ptr
  call void @intrinsic_println(ptr %t2153)
  %t2154 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.309)
  %t2155 = ptrtoint ptr %t2154 to i64
  %t2156 = inttoptr i64 %t2155 to ptr
  call void @intrinsic_println(ptr %t2156)
  store i64 0, ptr %local.ai.1997
  br label %loop105
loop105:
  %t2157 = load i64, ptr %local.ai.1997
  %t2158 = icmp sle i64 %t2157, 8
  %t2159 = zext i1 %t2158 to i64
  %t2160 = icmp ne i64 %t2159, 0
  br i1 %t2160, label %body105, label %endloop105
body105:
  %t2161 = load i64, ptr %local.ai.1997
  %t2162 = call i64 @"sx_int_to_f64"(i64 %t2161)
  %t2163 = call i64 @f64_parse(ptr @.str.exp_memory_dynamics.310)
  %t2164 = call i64 @"sx_f64_mul"(i64 %t2162, i64 %t2163)
  store i64 %t2164, ptr %local.a.1998
  %t2165 = load i64, ptr %local.a.1998
  %t2166 = load i64, ptr %local.obs.1986
  %t2167 = call i64 @"avg_k_beliefs"(i64 6, i64 %t2165, i64 %t2166)
  store i64 %t2167, ptr %local.mse.1999
  %t2168 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.311)
  %t2169 = ptrtoint ptr %t2168 to i64
  %t2170 = inttoptr i64 %t2169 to ptr
  call void @intrinsic_print(ptr %t2170)
  %t2171 = load i64, ptr %local.a.1998
  %t2172 = call i64 @"print_f64"(i64 %t2171)
  %t2173 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.312)
  %t2174 = ptrtoint ptr %t2173 to i64
  %t2175 = inttoptr i64 %t2174 to ptr
  call void @intrinsic_print(ptr %t2175)
  %t2176 = load i64, ptr %local.mse.1999
  %t2177 = call i64 @"print_f64"(i64 %t2176)
  %t2178 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.313)
  %t2179 = ptrtoint ptr %t2178 to i64
  %t2180 = inttoptr i64 %t2179 to ptr
  call void @intrinsic_println(ptr %t2180)
  %t2181 = load i64, ptr %local.ai.1997
  %t2182 = add i64 %t2181, 1
  store i64 %t2182, ptr %local.ai.1997
  br label %loop105
endloop105:
  %t2183 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.314)
  %t2184 = ptrtoint ptr %t2183 to i64
  %t2185 = inttoptr i64 %t2184 to ptr
  call void @intrinsic_println(ptr %t2185)
  %t2186 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.315)
  %t2187 = ptrtoint ptr %t2186 to i64
  %t2188 = inttoptr i64 %t2187 to ptr
  call void @intrinsic_println(ptr %t2188)
  %t2189 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.316)
  %t2190 = ptrtoint ptr %t2189 to i64
  %t2191 = inttoptr i64 %t2190 to ptr
  call void @intrinsic_println(ptr %t2191)
  %t2192 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.317)
  %t2193 = ptrtoint ptr %t2192 to i64
  %t2194 = inttoptr i64 %t2193 to ptr
  call void @intrinsic_println(ptr %t2194)
  %t2195 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.318)
  %t2196 = ptrtoint ptr %t2195 to i64
  %t2197 = inttoptr i64 %t2196 to ptr
  call void @intrinsic_println(ptr %t2197)
  %t2198 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.319)
  %t2199 = ptrtoint ptr %t2198 to i64
  %t2200 = inttoptr i64 %t2199 to ptr
  call void @intrinsic_println(ptr %t2200)
  %t2201 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.320)
  %t2202 = ptrtoint ptr %t2201 to i64
  %t2203 = inttoptr i64 %t2202 to ptr
  call void @intrinsic_println(ptr %t2203)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t2204 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.321)
  %t2205 = ptrtoint ptr %t2204 to i64
  %t2206 = inttoptr i64 %t2205 to ptr
  call void @intrinsic_println(ptr %t2206)
  %t2207 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.322)
  %t2208 = ptrtoint ptr %t2207 to i64
  %t2209 = inttoptr i64 %t2208 to ptr
  call void @intrinsic_println(ptr %t2209)
  %t2210 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.323)
  %t2211 = ptrtoint ptr %t2210 to i64
  %t2212 = inttoptr i64 %t2211 to ptr
  call void @intrinsic_println(ptr %t2212)
  %t2213 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.324)
  %t2214 = ptrtoint ptr %t2213 to i64
  %t2215 = inttoptr i64 %t2214 to ptr
  call void @intrinsic_println(ptr %t2215)
  %t2216 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.325)
  %t2217 = ptrtoint ptr %t2216 to i64
  %t2218 = inttoptr i64 %t2217 to ptr
  call void @intrinsic_println(ptr %t2218)
  %t2219 = call i64 @"run_exp1"()
  %t2220 = call i64 @"run_exp2"()
  %t2221 = call i64 @"run_exp3"()
  %t2222 = call i64 @"run_exp4"()
  %t2223 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.326)
  %t2224 = ptrtoint ptr %t2223 to i64
  %t2225 = inttoptr i64 %t2224 to ptr
  call void @intrinsic_println(ptr %t2225)
  %t2226 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.327)
  %t2227 = ptrtoint ptr %t2226 to i64
  %t2228 = inttoptr i64 %t2227 to ptr
  call void @intrinsic_println(ptr %t2228)
  %t2229 = call ptr @intrinsic_string_new(ptr @.str.exp_memory_dynamics.328)
  %t2230 = ptrtoint ptr %t2229 to i64
  %t2231 = inttoptr i64 %t2230 to ptr
  call void @intrinsic_println(ptr %t2231)
  ret i64 0
}


; String constants
@.str.exp_memory_dynamics.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.2 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_memory_dynamics.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.5 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.6 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.7 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.8 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.9 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.10 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.11 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.12 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.13 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.15 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.16 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.17 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.18 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.19 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.20 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.21 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_memory_dynamics.22 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_memory_dynamics.23 = private unnamed_addr constant [6 x i8] c"0.002\00"
@.str.exp_memory_dynamics.24 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.25 = private unnamed_addr constant [6 x i8] c"0.002\00"
@.str.exp_memory_dynamics.26 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.27 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_memory_dynamics.28 = private unnamed_addr constant [33 x i8] c"  EXP 1: OPTIMAL FORGETTING RATE\00"
@.str.exp_memory_dynamics.29 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_memory_dynamics.30 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.31 = private unnamed_addr constant [42 x i8] c"--- Stationary Environment (true=0.7) ---\00"
@.str.exp_memory_dynamics.32 = private unnamed_addr constant [16 x i8] c"  Lambda    MSE\00"
@.str.exp_memory_dynamics.33 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_memory_dynamics.34 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_memory_dynamics.35 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_memory_dynamics.36 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_memory_dynamics.37 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_memory_dynamics.38 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_memory_dynamics.39 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_memory_dynamics.40 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.41 = private unnamed_addr constant [29 x i8] c"  Best lambda (stationary): \00"
@.str.exp_memory_dynamics.42 = private unnamed_addr constant [7 x i8] c"  MSE=\00"
@.str.exp_memory_dynamics.43 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.44 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.45 = private unnamed_addr constant [53 x i8] c"--- Changing Environment (0.7 -> 0.3 at obs 100) ---\00"
@.str.exp_memory_dynamics.46 = private unnamed_addr constant [16 x i8] c"  Lambda    MSE\00"
@.str.exp_memory_dynamics.47 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_memory_dynamics.48 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_memory_dynamics.49 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_memory_dynamics.50 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_memory_dynamics.51 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_memory_dynamics.52 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.53 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_memory_dynamics.54 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_memory_dynamics.55 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.56 = private unnamed_addr constant [27 x i8] c"  Best lambda (changing): \00"
@.str.exp_memory_dynamics.57 = private unnamed_addr constant [7 x i8] c"  MSE=\00"
@.str.exp_memory_dynamics.58 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.59 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.60 = private unnamed_addr constant [38 x i8] c"--- Meta-Gradient Learning Lambda ---\00"
@.str.exp_memory_dynamics.61 = private unnamed_addr constant [5 x i8] c"0.95\00"
@.str.exp_memory_dynamics.62 = private unnamed_addr constant [5 x i8] c"0.95\00"
@.str.exp_memory_dynamics.63 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.64 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_memory_dynamics.65 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_memory_dynamics.66 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_memory_dynamics.67 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.68 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_memory_dynamics.69 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.70 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_memory_dynamics.71 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_memory_dynamics.72 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.73 = private unnamed_addr constant [37 x i8] c"  Meta-learned lambda (stationary): \00"
@.str.exp_memory_dynamics.74 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.75 = private unnamed_addr constant [37 x i8] c"  Meta-learned lambda (changing):   \00"
@.str.exp_memory_dynamics.76 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.77 = private unnamed_addr constant [62 x i8] c"  FINDING: Stationary prefers higher lambda (less forgetting)\00"
@.str.exp_memory_dynamics.78 = private unnamed_addr constant [5 x i8] c"0.97\00"
@.str.exp_memory_dynamics.79 = private unnamed_addr constant [72 x i8] c"  FINDING: Changing environment needs faster forgetting (lambda < 0.97)\00"
@.str.exp_memory_dynamics.80 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_memory_dynamics.81 = private unnamed_addr constant [70 x i8] c"  FINDING: Meta-gradient recovered near-optimal lambda for stationary\00"
@.str.exp_memory_dynamics.82 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_memory_dynamics.83 = private unnamed_addr constant [68 x i8] c"  FINDING: Meta-gradient recovered near-optimal lambda for changing\00"
@.str.exp_memory_dynamics.84 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.85 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.86 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.88 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.89 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.90 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.91 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.92 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.93 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.94 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.95 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.96 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.97 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.98 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.99 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.100 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.101 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.102 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.103 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.104 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.105 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.106 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.107 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.108 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_memory_dynamics.109 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_memory_dynamics.110 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_memory_dynamics.111 = private unnamed_addr constant [43 x i8] c"  EXP 2: TRANSFER LEARNING BETWEEN BELIEFS\00"
@.str.exp_memory_dynamics.112 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_memory_dynamics.113 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.114 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_memory_dynamics.115 = private unnamed_addr constant [32 x i8] c"  Source: A (true=0.7, 100 obs)\00"
@.str.exp_memory_dynamics.116 = private unnamed_addr constant [31 x i8] c"  Target: B (variable, 60 obs)\00"
@.str.exp_memory_dynamics.117 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.118 = private unnamed_addr constant [52 x i8] c"  B_true    Fresh_MSE    Transfer_MSE   Improvement\00"
@.str.exp_memory_dynamics.119 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_memory_dynamics.120 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_memory_dynamics.121 = private unnamed_addr constant [13 x i8] c"  0.65      \00"
@.str.exp_memory_dynamics.122 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.123 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.124 = private unnamed_addr constant [7 x i8] c"BETTER\00"
@.str.exp_memory_dynamics.125 = private unnamed_addr constant [6 x i8] c"WORSE\00"
@.str.exp_memory_dynamics.126 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.127 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_memory_dynamics.128 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_memory_dynamics.129 = private unnamed_addr constant [13 x i8] c"  0.50      \00"
@.str.exp_memory_dynamics.130 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.131 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.132 = private unnamed_addr constant [7 x i8] c"BETTER\00"
@.str.exp_memory_dynamics.133 = private unnamed_addr constant [6 x i8] c"WORSE\00"
@.str.exp_memory_dynamics.134 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.135 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_memory_dynamics.136 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_memory_dynamics.137 = private unnamed_addr constant [13 x i8] c"  0.20      \00"
@.str.exp_memory_dynamics.138 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.139 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.140 = private unnamed_addr constant [7 x i8] c"BETTER\00"
@.str.exp_memory_dynamics.141 = private unnamed_addr constant [6 x i8] c"WORSE\00"
@.str.exp_memory_dynamics.142 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.143 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_memory_dynamics.144 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_memory_dynamics.145 = private unnamed_addr constant [13 x i8] c"  0.70      \00"
@.str.exp_memory_dynamics.146 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.147 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.148 = private unnamed_addr constant [7 x i8] c"BETTER\00"
@.str.exp_memory_dynamics.149 = private unnamed_addr constant [6 x i8] c"WORSE\00"
@.str.exp_memory_dynamics.150 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.151 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.152 = private unnamed_addr constant [12 x i8] c"  ANALYSIS:\00"
@.str.exp_memory_dynamics.153 = private unnamed_addr constant [64 x i8] c"  - Transfer helps when domains are similar (positive transfer)\00"
@.str.exp_memory_dynamics.154 = private unnamed_addr constant [71 x i8] c"  - Transfer hurts when domains are very different (negative transfer)\00"
@.str.exp_memory_dynamics.155 = private unnamed_addr constant [57 x i8] c"  - The crossover point reveals the similarity threshold\00"
@.str.exp_memory_dynamics.156 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.157 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.158 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.159 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.160 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.161 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.162 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_memory_dynamics.163 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.164 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.165 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.166 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.167 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.168 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_memory_dynamics.169 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_memory_dynamics.170 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_memory_dynamics.171 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_memory_dynamics.172 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.173 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.174 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_memory_dynamics.175 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_memory_dynamics.176 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.177 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_memory_dynamics.178 = private unnamed_addr constant [33 x i8] c"  EXP 3: SELF-REFERENTIAL BELIEF\00"
@.str.exp_memory_dynamics.179 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_memory_dynamics.180 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.181 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_memory_dynamics.182 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.183 = private unnamed_addr constant [37 x i8] c"  Baseline (no self-reference): MSE=\00"
@.str.exp_memory_dynamics.184 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.185 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.186 = private unnamed_addr constant [38 x i8] c"  Coupling   MSE          vs_Baseline\00"
@.str.exp_memory_dynamics.187 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.188 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_memory_dynamics.189 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_memory_dynamics.190 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_memory_dynamics.191 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_memory_dynamics.192 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.193 = private unnamed_addr constant [7 x i8] c"BETTER\00"
@.str.exp_memory_dynamics.194 = private unnamed_addr constant [6 x i8] c"WORSE\00"
@.str.exp_memory_dynamics.195 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.196 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.197 = private unnamed_addr constant [29 x i8] c"  Best coupling from sweep: \00"
@.str.exp_memory_dynamics.198 = private unnamed_addr constant [7 x i8] c"  MSE=\00"
@.str.exp_memory_dynamics.199 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.200 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.201 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.202 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_memory_dynamics.203 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.204 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_memory_dynamics.205 = private unnamed_addr constant [26 x i8] c"  Meta-learned coupling: \00"
@.str.exp_memory_dynamics.206 = private unnamed_addr constant [7 x i8] c"  MSE=\00"
@.str.exp_memory_dynamics.207 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.208 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.209 = private unnamed_addr constant [62 x i8] c"  FINDING: Self-referential structure CAN improve convergence\00"
@.str.exp_memory_dynamics.210 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.211 = private unnamed_addr constant [75 x i8] c"  FINDING: Non-trivial coupling is optimal (not just ignoring meta-belief)\00"
@.str.exp_memory_dynamics.212 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_memory_dynamics.213 = private unnamed_addr constant [55 x i8] c"  FINDING: Meta-gradient approximates optimal coupling\00"
@.str.exp_memory_dynamics.214 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_memory_dynamics.215 = private unnamed_addr constant [77 x i8] c"  FINDING: Strong self-amplification helps — confident agent learns faster\00"
@.str.exp_memory_dynamics.216 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.217 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.218 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_memory_dynamics.219 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_memory_dynamics.220 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_memory_dynamics.221 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_memory_dynamics.222 = private unnamed_addr constant [4 x i8] c"0.6\00"
@.str.exp_memory_dynamics.223 = private unnamed_addr constant [5 x i8] c"0.35\00"
@.str.exp_memory_dynamics.224 = private unnamed_addr constant [5 x i8] c"0.65\00"
@.str.exp_memory_dynamics.225 = private unnamed_addr constant [5 x i8] c"0.45\00"
@.str.exp_memory_dynamics.226 = private unnamed_addr constant [5 x i8] c"0.75\00"
@.str.exp_memory_dynamics.227 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_memory_dynamics.228 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.229 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.230 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.231 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.232 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.233 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.234 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.235 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.236 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.237 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.238 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.239 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.240 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.241 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.242 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.243 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.244 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.245 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.246 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.247 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_memory_dynamics.248 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.249 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.250 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.251 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.252 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.253 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.254 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.255 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.256 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.257 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.258 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.259 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.260 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.261 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.262 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.263 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.264 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.265 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.266 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.267 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.268 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.269 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.270 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.271 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.272 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.273 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.274 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.275 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.276 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.277 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.278 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_memory_dynamics.279 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.280 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_memory_dynamics.281 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.282 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.283 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_memory_dynamics.284 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_memory_dynamics.285 = private unnamed_addr constant [42 x i8] c"  EXP 4: PHASE TRANSITION IN BELIEF COUNT\00"
@.str.exp_memory_dynamics.286 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_memory_dynamics.287 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.288 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_memory_dynamics.289 = private unnamed_addr constant [50 x i8] c"--- Independent beliefs (alpha=0) as baseline ---\00"
@.str.exp_memory_dynamics.290 = private unnamed_addr constant [40 x i8] c"  K    Indep_MSE    Coupled_MSE   Ratio\00"
@.str.exp_memory_dynamics.291 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.292 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.293 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_memory_dynamics.294 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_memory_dynamics.295 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_memory_dynamics.296 = private unnamed_addr constant [2 x i8] c" \00"
@.str.exp_memory_dynamics.297 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_memory_dynamics.298 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.299 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_memory_dynamics.300 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.301 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.302 = private unnamed_addr constant [49 x i8] c"  Largest error jump between consecutive K at K=\00"
@.str.exp_memory_dynamics.303 = private unnamed_addr constant [10 x i8] c"  (delta=\00"
@.str.exp_memory_dynamics.304 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_memory_dynamics.305 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_memory_dynamics.306 = private unnamed_addr constant [61 x i8] c"  FINDING: Phase transition detected — error jumps sharply\00"
@.str.exp_memory_dynamics.307 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.308 = private unnamed_addr constant [39 x i8] c"--- Coupling strength sweep at K=6 ---\00"
@.str.exp_memory_dynamics.309 = private unnamed_addr constant [15 x i8] c"  Alpha    MSE\00"
@.str.exp_memory_dynamics.310 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_memory_dynamics.311 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_memory_dynamics.312 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_memory_dynamics.313 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.314 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.315 = private unnamed_addr constant [12 x i8] c"  ANALYSIS:\00"
@.str.exp_memory_dynamics.316 = private unnamed_addr constant [39 x i8] c"  - Low K: interaction has mild effect\00"
@.str.exp_memory_dynamics.317 = private unnamed_addr constant [63 x i8] c"  - High K: mean-field coupling pulls beliefs toward consensus\00"
@.str.exp_memory_dynamics.318 = private unnamed_addr constant [58 x i8] c"  - If true values are spread out, consensus = inaccuracy\00"
@.str.exp_memory_dynamics.319 = private unnamed_addr constant [63 x i8] c"  - Phase transition: the K where coupling overwhelms evidence\00"
@.str.exp_memory_dynamics.320 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.321 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_memory_dynamics.322 = private unnamed_addr constant [45 x i8] c"#  MEMORY DYNAMICS: FORGETTING, TRANSFER,  #\00"
@.str.exp_memory_dynamics.323 = private unnamed_addr constant [45 x i8] c"#  SELF-REFERENCE, AND PHASE TRANSITIONS   #\00"
@.str.exp_memory_dynamics.324 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_memory_dynamics.325 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_memory_dynamics.326 = private unnamed_addr constant [45 x i8] c"############################################\00"
@.str.exp_memory_dynamics.327 = private unnamed_addr constant [46 x i8] c"#  ALL EXPERIMENTS COMPLETE                 #\00"
@.str.exp_memory_dynamics.328 = private unnamed_addr constant [45 x i8] c"############################################\00"
